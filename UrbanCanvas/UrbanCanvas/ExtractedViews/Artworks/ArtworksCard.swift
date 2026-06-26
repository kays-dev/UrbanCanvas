//
//  ArtworksCard.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import SwiftUI

struct ArtworksCard: View {
    let artwork: StreetArt
    
    var body: some View {
        HStack(spacing: 8){
            Image(artwork.picture)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .aspectRatio(1/1 ,contentMode: .fit)
                .clipShape(.circle)
                .frame(height: 60)
            
            VStack(alignment: .leading){
                Text(artwork.name)
                    .font(.default)
                
                HStack(spacing: 8){
                    Image(systemName: "mappin")
                        .symbolVariant(.circle.fill)
                    
                    Text(artwork.city)
                }
                .font(.callout)
                .foregroundStyle(.secondText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .foregroundStyle(.mainText)
        .mask(RoundedRectangle(cornerRadius: 28))  
    }
}

#Preview {
    ArtworksCard(artwork: artworks[0])
}
