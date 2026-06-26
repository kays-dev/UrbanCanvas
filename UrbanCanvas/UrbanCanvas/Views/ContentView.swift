//
//  ContentView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Oeuvres", systemImage: "photo.artframe") {
                ArtworksView()
            }
            
            Tab("Auteurs", systemImage: "person.fill") {
                AuthorsView()
            }
            
            Tab("Missions", systemImage: "target") {
                MissionsView()
            }
        }

    }
}

#Preview {
    ContentView()
}
