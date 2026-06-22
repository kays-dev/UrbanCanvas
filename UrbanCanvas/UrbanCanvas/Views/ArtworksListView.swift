//
//  ArtworksListView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import SwiftUI

struct ArtworksListView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.bgGray
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 24){
                    Spacer()
                    
                    Text("Liste des Street arts")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.mainText)
                    
                        List{
                            ForEach(artworks){ artwork in
                                NavigationLink(value: artwork) {
                                    ArtworksCardView(artwork: artwork)
                                }
                            }
                        }
                        .listStyle(.plain)
                        .scrollIndicators(.hidden)
                        .mask(RoundedRectangle(cornerRadius: 28))
                    
                }
                .padding(.horizontal, 24)
                
            }
        }
    }
}

#Preview {
    ArtworksListView()
}
