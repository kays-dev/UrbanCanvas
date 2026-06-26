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
    @Binding var  discovered : Int
    
    var body: some View {
        VStack(spacing: 16){
            HStack{
                Image(systemName: "\(cardIndex+1).circle")
                
                Text(artwork.name)
                
            }
            .font(.callout)
            .padding(.top)
            
            
            NavigationLink("Consulter la fiche"){
                ArtworksDetailsView(artwork: artwork)
            }
            .buttonStyle(ActionButton())
            .frame(maxWidth: 180)
            
            
            Button{
                artwork.discovered = true
                discovered += 1
            } label : {
                Label(!artwork.discovered ? "Non découvert" : "Découvert", systemImage: !artwork.discovered ? "seal" : "checkmark.seal.fill")
                    .foregroundStyle(!artwork.discovered ? .secondText : .white)
                    .font(.caption)
                    .bold()
                    .padding(.vertical, 8)
                    .frame(maxWidth: 180)
            }
            .contentShape(.capsule)
            .glassEffect(.regular.tint(!artwork.discovered ? .white : .accent), in : .rect(cornerRadius: 28.0))
            .disabled(!artwork.discovered ? false : true)
            
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
                .allowsHitTesting(false)
        }
        .background{
            RoundedRectangle(cornerRadius: 28)
                .fill(.white)
        }
        .onChange(of: artwork.discovered) {
            print("\(artwork.name) découvert")
        }
        
    }
}

#Preview {
    struct PreviewMissionCard : View {
        var index = 0
        @State private var artwork : StreetArt = artworks[0]
        @State private var selected : StreetArt? = artworks[0]
        @State private var discovered : Int = 0
        
        var body : some View {
            MissionCard(cardIndex: index, artwork: $artwork, selected: $selected, discovered: $discovered)
        }
    }
    
    return PreviewMissionCard ()
}
