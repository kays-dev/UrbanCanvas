//
//  ArtworksListView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import SwiftUI

struct ArtworksListView: View {
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
            ZStack{
                Color.bgGray
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 24){
                    Text("Liste des Street arts")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.mainText)
                        .padding(.top)
                    
                    List(filteredList){ artwork in
                        NavigationLink(value: artwork) {
                            ArtworksCardView(artwork: artwork)
                        }
                    }
                    .navigationDestination(for: StreetArt.self){ artwork in
                        ArtworksDetailsView(artwork: artwork)
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                    .mask(RoundedRectangle(cornerRadius: 28))
                    
                }
                .padding(.horizontal, 24)
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
                                    selectedType = type
                                    filterArtworks()
                                }
                            }
                        } message : {
                            Text("Choisissez un type d’art")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        //                        Picker("Vue", selection: $selectedView) {
                        //                                Text("Liste").tag("Liste")
                        //                                    .background{
                        //                                        Capsule()
                        //                                            .fill(selectedView == "Liste" ? .secondOrange  : .white)
                        //                                    }
                        //                                    .glassEffect(.regular.tint(.orange).interactive())
                        //
                        //                                Text("Carte").tag("Carte")
                        //                                    .background{
                        //                                        Capsule()
                        //                                            .fill(selectedView == "Liste" ? .secondOrange  : .white)
                        //                                    }
                        
                        HStack(spacing: -4){
                            Button("Liste"){
                                selectedView = "Liste"
                            }
                            .padding(.horizontal, 48)
                            .background{
                                Capsule()
                                    .fill(selectedView == "Liste" ? .secondOrange  : .white)
                            }
                            
                            
                            Button("Carte"){
                                selectedView = "Carte"
                            }
                            .padding(.horizontal, 48)
                            .background{
                                Capsule()
                                    .fill(selectedView == "Carte" ? .secondOrange : .white.opacity(0))
                            }
                        }
                        .font(.caption)
                        .bold()
                        //                        }
                        //                        .pickerStyle(.segmented)
                        //                        .fixedSize()
                    }
                }
                
            }
        }
    }
}

#Preview {
    ArtworksListView()
}
