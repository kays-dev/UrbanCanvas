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
            center: CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @Binding var selectedType : ArtType
    @Binding var showDialog : Bool
    @Binding var filteredList : [StreetArt]
    
    @State private var selectedMarker : StreetArt?
    @State private var showSheet : Bool = false
    
    private func cameraPosition(_ list : [StreetArt]){
        
        if list.count != 1 {
            
            for i in 1..<list.count {
                if list[i - 1].city != list[i].city {
                    position =
                    MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
                            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                        ))
                } else {
                    if let artworkCity = cities.first(where: { $0.name.lowercased() == list[i].city.lowercased()}) {
                        
                        position =
                        MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: artworkCity.coordinates,
                                span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)))
                    } else {
                        position =
                        MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
                                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                            ))
                    }
                }
            }
        } else {
            position =
            MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: list[0].lat, longitude: list[0].long),
                    span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)))
        }
    }
    
    var body: some View {
        Map(position: $position, selection: $selectedMarker){
            ForEach(filteredList){ artwork in
                
                Marker(artwork.name, systemImage: "mappin", coordinate: CLLocationCoordinate2D(latitude: artwork.lat, longitude: artwork.long))
                    .tint(.secondOrange)
                    .tag(artwork)
            }
        }
        .onChange(of: filteredList) {
            withAnimation{
                cameraPosition(filteredList)
            }
        }
        .onChange(of: selectedMarker) { oldvalue, newvalue in
            if newvalue == nil {
                showSheet = false
            } else {
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet, onDismiss: { selectedMarker = nil}) {
            if let artwork = selectedMarker {
                ArtworkMapPreview(artwork: artwork)
                    .presentationDetents([
                        .fraction(0.4), .fraction(1)])
                    .presentationDragIndicator(.automatic)
            }
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
