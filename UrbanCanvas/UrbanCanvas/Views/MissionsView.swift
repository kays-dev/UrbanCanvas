//
//  MissionsView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 25/06/2026.
//

import SwiftUI

struct MissionsView: View {
    
    @State private var missions : [StreetArt] = []
    
    @State private var showNoMissions : Bool = false
    
    @State private var showSheet : Bool = false
    @State private var selectedMission : StreetArt?
    @Environment(\.dismiss) private var dismiss
    
    private func getMissionNum(_ mission : StreetArt) -> Int{
        var index = 0
        
        for i in 0..<missions.count where missions[i] == mission {
            index = i
        }
        
        return index
    }
    
    private func generateMissions(){
        var artworksList = artworks.filter{ !$0.discovered }
        
        artworksList = artworksList.shuffled()
        
        let missionNumber = artworksList.count > 3 ? 5 : 3
        var i = 0
        
        while  i < missionNumber {
            missions.append(artworksList.first(where : {!missions.contains($0) && !missions.map({$0.author}).contains($0.author)})!)
            
            for artwork in missions {
                if missions.filter({$0.type == artwork.type}).count > missionNumber - 1 {
                    
                    missions[i] = artworksList.first(where : {!missions.contains($0) && !missions.map({$0.author}).contains($0.author) && $0.type != artwork.type})!
                    
                } else {
                    continue
                }
            }
            i += 1
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    ForEach($missions){ $mission in
                        MissionCard(cardIndex: getMissionNum(mission), artwork: $mission, selected: $selectedMission)
                    }
                }
                .onChange(of: selectedMission) { oldvalue, newvalue in
                    if newvalue == nil {
                        showSheet = false
                    } else {
                        showSheet = true
                    }
                }
                .padding()
            }
            .task{
                generateMissions()
                
                if missions.isEmpty {
                    showNoMissions = true
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.bgGray)
            .scrollIndicators(.hidden)
        }
        .overlay(alignment: .center){
            if showNoMissions == true {
                ContentUnavailableView("Pas de missions", systemImage: "photo.artframe", description: Text("Vous n'avez plus de Streetarts à découvrir").foregroundStyle(.secondText))
                    .foregroundStyle(.secondOrange)
                    .frame(width: .infinity, height: .infinity, alignment: .center)
            }
        }
        .sheet(isPresented: $showSheet, onDismiss: { selectedMission = nil}) {
            if let mission = selectedMission {
                ArtworksDetailsView(artwork: mission)
                    .presentationDetents([.fraction(1)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    MissionsView()
}
