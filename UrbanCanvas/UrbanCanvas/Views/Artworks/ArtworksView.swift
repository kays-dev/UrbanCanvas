//
//  ArtworksView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 23/06/2026.
//

import SwiftUI

struct ArtworksView: View {
    @State private var selectedType : ArtType = .all
    @State private var showDialog : Bool = false
    @State private var filteredList : [StreetArt] = artworks.sorted{ $0.name.lowercased() < $1.name.lowercased() }
    
    private func filterArtworks(){
        var list = artworks.sorted{ $0.name.lowercased() < $1.name.lowercased() }
        
        if selectedType != .all {
            list = list.filter { $0.type == selectedType }
        }
        
        filteredList = list
    }
    
    @State private var selectedView = "Liste"
    
    var body: some View {
        NavigationStack{
            VStack{
                if selectedView == "Liste" { ArtworksListView(selectedType: $selectedType, showDialog: $showDialog, filteredList: $filteredList)
                        .background(Color.bgGray
                            .ignoresSafeArea())
                        .navigationTitle("Liste des Street arts")
                        .navigationBarTitleDisplayMode(.automatic)
                } else {
                    ArtworksMapView(selectedType: $selectedType, showDialog: $showDialog, filteredList: $filteredList)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showDialog = true
                    } label : {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    .confirmationDialog("Liste des filtres", isPresented: $showDialog, titleVisibility: .visible) {
                        ForEach(ArtType.allCases, id : \.self){ type in
                            Button("\(type.rawValue)", role : selectedType == type ? .destructive : .confirm){
                                withAnimation {
                                    selectedType = type
                                    filterArtworks()
                                }
                            }
                        }
                    } message : {
                        Text("Choisissez un type d’art")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Picker("Vue", selection: $selectedView) {
                        Text("Liste").tag("Liste")
                            .background{
                                Capsule()
                                    .fill(selectedView == "Liste" ? .secondOrange  : .white)
                            }
                        
                        Text("Carte").tag("Carte")
                            .background{
                                Capsule()
                                    .fill(selectedView == "Carte" ? .secondOrange  : .white)
                            }
                    }
                    .pickerStyle(.segmented)
                    .tint(.secondOrange)
                    .frame(width: 300)
                    .fixedSize()
                }
            }            
        }
    }
}

#Preview {
    ArtworksView()
}
