//
//  ArtworksDetailsView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import SwiftUI
import MapKit

struct ArtworksDetailsView: View {
    let artwork: StreetArt
    
    func getToDateFormat(dateComp: DateComponents) -> String? {
        let thisDate = Calendar.current.date(from: dateComp)
        
        var newDate = " "
        
        if let formatting = thisDate?.formatted(Date.FormatStyle().month(.abbreviated)){
            
            newDate = "\(getFrenchMonth(format: formatting)) " + "\(thisDate?.formatted(Date.FormatStyle().year()) ?? "")"
        }
        
        return newDate
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 24){
                VStack(alignment: .leading, spacing: 12){
                    Text(artwork.name)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.accent)
                    
                    Text(artwork.detail)
                        .multilineTextAlignment(.leading)
                    
                    VStack (alignment: .leading){
                        Text(
                        """
                        \(Text("Type : ").bold())\
                        \(Text(artwork.type.rawValue))
                        """
                        )
                        
                        Text(
                        """
                        \(Text("Condition : ").bold())\
                        \(Text(artwork.state.rawValue))
                        """
                        )
                        
                        Text(
                        """
                        \(Text("Date : ").bold())\
                        \(Text(getToDateFormat(dateComp: artwork.created) ?? ""))
                        """
                        )
                        
                        Text(
                        """
                        \(Text("Auteur : ").bold())\
                        \(Text(artwork.author))
                        """
                        )
                        
                        Text(
                        """
                        \(Text("Localisation : ").bold())\
                        \(Text("\(artwork.street), \(artwork.postCode) \(artwork.city) (Latitude : \(artwork.lat.description), Longitude : \(artwork.long.description))"))
                        """
                        )
                        .multilineTextAlignment(.leading)
                    }
                }
                .font(.footnote)
                .padding(.top, 16)
                
                Spacer()
                
            }
            .padding(.horizontal, 24)
            .safeAreaInset(edge: .top){
                Image(artwork.picture)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0,
                           maxWidth: .infinity
                    )
                    .frame(height : 278)
                    .clipped()
            }
            .safeAreaInset(edge: .bottom){
                VStack {
                    ArtworkMap(artwork: artwork)
                        .padding(.bottom)
                    
                    Text("Image founie par")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 44)
                .padding(.horizontal, 24)
            }
        }
        .scrollIndicators(.hidden)
        .foregroundStyle(.mainText)
        .ignoresSafeArea()
    }
}

#Preview {
    ArtworksDetailsView(artwork: artworks[0])
}
