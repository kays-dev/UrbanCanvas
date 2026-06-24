//
//  ArtworkMapPreview.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 24/06/2026.
//

import SwiftUI

struct ArtworkMapPreview: View {
    let artwork: StreetArt
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                Image(artwork.picture)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           maxHeight: 174
                    )
                    .clipped()
                
                Text("""
                \(artwork.detail)
                """)
                .padding(.horizontal, 24)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label : {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(artwork.name)
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink{
                        ArtworksDetailsView(artwork: artwork)
                    } label : {
                        Image(systemName: "arrow.right")
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.secondOrange)
                }
            }
        }
    }
}

#Preview {
    ArtworkMapPreview(artwork: artworks[0])
}
