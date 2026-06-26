//
//  ArtworkMap.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 23/06/2026.
//

import SwiftUI
import MapKit

struct ArtworkMap: View {
    let artwork: StreetArt
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
        Map(position: $position){
            Annotation(artwork.name, coordinate: CLLocationCoordinate2D(latitude: artwork.lat, longitude: artwork.long), anchor: .center ) {
                Circle()
                    .stroke(.white, lineWidth: 2)
                    .background{
                        Image(artwork.picture)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                    }
                    .frame(height: 48)
                    .shadow(color: .mainText, radius: 0.2)
                    
            }
            .annotationTitles(.hidden)
        }
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .frame(height: 158)
        .allowsHitTesting(false)
        .onAppear{
            position =
            MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: artwork.lat, longitude: artwork.long),
                    span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
                )
            )
        }
    }
}

#Preview {
    ArtworkMap(artwork: artworks[0])
}
