//
//  MissionCard.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 25/06/2026.
//

import SwiftUI

struct MissionCard: View {
    var  cardIndex : Int
    
    @Binding var  artwork : StreetArt
    @Binding var  selected : StreetArt?
    
    var body: some View {
        VStack(spacing: 16){
            HStack{
                Image(systemName: "\(cardIndex+1).circle")
                
                Text(artwork.name)
                
                Button{
                    selected = artwork
                } label : {
                    Image(systemName: "arrow.up.right")
                        .foregroundStyle(.white)
                        .font(.callout)
                        .padding(8)
                        .background{
                            Circle()
                        }
                        .buttonStyle(.borderedProminent)
                }
                .contentShape(.circle)
                
            }
            .font(.callout)
            .bold()
            .foregroundStyle(.secondOrange)
            .padding(.top)
            
            Button{
                artwork.discovered = true
            } label : {
                Label(!artwork.discovered ? "Non découvert" : "Découvert", systemImage: !artwork.discovered ? "seal" : "checkmark.seal.fill")
                    .foregroundStyle(!artwork.discovered ? .secondText : .white)
                    .font(.caption)
                    .bold()
                    .padding(.vertical, 8)
                    .padding(.horizontal, 24)
            }
            .contentShape(.capsule)
            .glassEffect(.regular.tint(!artwork.discovered ? .white : .secondOrange), in : .rect(cornerRadius: 28.0))
            
            Image(artwork.picture)
                .resizable()
                .scaledToFill()
                .frame(height: 304)
                .frame(minWidth: 0,
                       maxWidth: .infinity
                )
                .clipShape(.rect(topLeadingRadius: 28, bottomLeadingRadius: 28, bottomTrailingRadius: 28, topTrailingRadius: 28))
                .overlay{
                    RoundedRectangle(cornerRadius: 28)
                        .fill(.white.opacity(0.4))
                        .stroke(.bgGray, lineWidth: 4)
                }
                .overlay(alignment: .bottom){
                    VStack(spacing : 8){
                        Text(
                                    """
                                    \(Text("Type").bold())
                                    \(Text(artwork.type.rawValue))
                                    """
                        )
                        
                        Text(
                                    """
                                    \(Text("Auteur").bold())
                                    \(Text(artwork.author))
                                    """
                        )
                        
                        Text(
                                    """
                                    \(Text("Localisation").bold())
                                    \(artwork.street), \(artwork.postCode) \(artwork.city) (Latitude : \(artwork.lat.description), Longitude : \(artwork.long.description))
                                    """
                        )
                        
                    }
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .glassEffect(in : .rect(cornerRadius: 24))
                    .padding()
                }
        }
        .background{
            RoundedRectangle(cornerRadius: 28)
                .fill(.white)
        }
        
    }
}

#Preview {
    struct PreviewMissionCard : View {
        var index = 0
        @State private var artwork : StreetArt = artworks[0]
        @State private var selected : StreetArt? = artworks[0]
        
        var body : some View {
            MissionCard(cardIndex: index, artwork: $artwork, selected: $selected)
        }
    }
    
    return PreviewMissionCard ()
}
