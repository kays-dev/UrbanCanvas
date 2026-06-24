//
//  ArtworksListView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import SwiftUI

struct ArtworksListView: View {
    @Binding var selectedType : ArtType
    @Binding var showDialog : Bool
    @Binding var filteredList : [StreetArt]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Liste des Street arts")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.mainText)
            
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
    }
}

#Preview {
    struct PreviewArtworksListView : View {
        @State private var selectedType : ArtType = .all
        @State private var showDialog : Bool = false
        @State private var filteredList : [StreetArt] = artworks.sorted{ $0.name.lowercased() < $1.name.lowercased() }
        
        var body : some View {
            ArtworksListView(selectedType: $selectedType, showDialog: $showDialog, filteredList: $filteredList)
        }
    }
    
    return PreviewArtworksListView()
}
