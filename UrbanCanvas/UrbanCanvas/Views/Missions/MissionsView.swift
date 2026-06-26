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
    @State private var showSuccess  : Bool = false
    
    @State private var showSheet : Bool = false
    @State private var selectedMission : StreetArt? = nil
    
    @State private var discovered : Int = 0
    
    private func getMissionNum(_ mission : StreetArt) -> Int{
        var index = 0
        
        for i in 0..<missions.count where missions[i] == mission {
            index = i
        }
        
        return index
    }
    
    private func generateMissions(){
        missions = []
        discovered = 0
        
        let artworksList = artworks.filter{ !$0.discovered }.shuffled()
        
        if artworksList.count >= 3 {
            showNoMissions = false
        } else {
            showNoMissions = true
            return
        }
        
        let missionNumber = min(artworksList.count >= 5 ? 5 : 3, artworksList.count)
        
        for artwork in artworksList{
            guard missions.count < missionNumber else { break }
            
            let sameArtwork = missions.map{ $0 }.contains(artwork)
            let sameAuthor = missions.map{ $0.author }.contains(artwork.author)
            let sameType = missions.filter{ $0.type == artwork.type}.count >= 2
            
            if !sameArtwork && !sameAuthor && !sameType{
                missions.append(artwork)
            }
        }
        
        if missions.isEmpty {
            showNoMissions = true
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollViewReader { topOfList in
                
                ScrollView{
                    VStack(spacing: 20){
                        
                        if missions.count != 0 {
                            Text("\(discovered) \(discovered > 1 ? "oeuvres" : "oeuvre") \(discovered > 1 ? "découvertes" : "découverte") sur \(missions.count)")
                                .bold()
                                .foregroundStyle(.accent)
                                .padding(.bottom)
                                .id(1)
                            
                            ForEach($missions){ $mission in
                                MissionCard(cardIndex: getMissionNum(mission), artwork: $mission, selected: $selectedMission, discovered: $discovered)
                            }
                            
                        }
                    }
                    .padding(24)
                }
                .onAppear{
                    guard missions.isEmpty else { return }
                    generateMissions()
                }
                .onChange(of: discovered) {
                    if discovered != 0 && discovered == missions.count {
                        showSuccess = true
                        topOfList.scrollTo(1)
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
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .alert("Mission terminée !", isPresented: $showSuccess, actions: {
                
                Button("Nouvelle mission", role: .close) {
                    var i = 0
                    
                    while i < artworks.count {
                        
                        if let sameArtwork = missions.first(where: { $0.id == artworks[i].id}){
                            
                            artworks[i].discovered = sameArtwork.discovered
                        }
                        
                        i += 1
                    }
                    
                    generateMissions()
                }
                
            }, message: {
                Text("Vous avez découvert tous les Streetarts proposés. On repart pour un tour ?")
            })
        }
    }
}

#Preview {
    MissionsView()
}
