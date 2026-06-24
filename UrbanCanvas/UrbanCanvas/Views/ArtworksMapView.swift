//
//  ArtworksMapView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 23/06/2026.
//

import SwiftUI
import MapKit

struct ArtworksMapView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: marseille.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.05)
        )
    )
    
    @Binding var selectedType : ArtType
    @Binding var showDialog : Bool
    @Binding var filteredList : [StreetArt]
    
    private func cameraPosition(_ list : [StreetArt]){
        for i in 1..<list.count {
            if list[i - 1].city != list[i].city {
                
                position =
                MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
                        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                    ))
                
            } else {
                
                let coord = cities.filter{$0.name == list[i].city}.first?.coordinates
                
                position =
                MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: coord ?? CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
            }
        }
    }
    
    var body: some View {
        Map(position: $position){
            ForEach(filteredList){ artwork in
                
                Marker(artwork.name, systemImage: "mappin", coordinate: CLLocationCoordinate2D(latitude: artwork.lat, longitude: artwork.long))
                    .tint(.secondOrange)
            }
        }
        .onChange(of: filteredList) {
            cameraPosition(filteredList)
        }
    }
}

#Preview {
    struct PreviewArtworksMapView : View {
        @State private var selectedType : ArtType = .all
        @State private var showDialog : Bool = false
        @State private var filteredList : [StreetArt] = artworks.sorted{ $0.name.lowercased() < $1.name.lowercased() }
        
        var body : some View {
            ArtworksMapView(selectedType: $selectedType, showDialog: $showDialog, filteredList: $filteredList)
        }
    }
    
    return PreviewArtworksMapView()
}
