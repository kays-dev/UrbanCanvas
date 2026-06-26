//
//  Author.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 24/06/2026.
//

import Foundation

//Structure des auteurs
struct Author :  Identifiable, Hashable {
    let id = UUID()
    
    let name : String
    var profile : String?
    
    var age : String = "NC"
    let origin : String
    
    let style : AuthorStyle
    
    let link : String?
}

//Instances des auteurs

let kan = Author(name: "KAN DMV", profile: "kan", age : "49", origin: "France", style: .pointilism, link: "https://kandmv.com")

let cite = Author(name: "Cité Création", origin: "France", style: .mural, link: "https://citecreation.fr")

let seth = Author(name: "Seth Globepainter", profile: "seth", age: "54", origin: "France", style: .globepaiting, link: "https://seth.fr")

let mahn = Author(name: "Mahn Kloix", profile: "mahn", age: "46", origin: "France", style: .mural, link: "https://www.mahn.fr")

let aerosol = Author(name: "Jef Aérosol", profile: "aerosol", age: "69", origin: "France", style: .mural, link: "https://www.jefaerosol.com")

let obey = Author(name: "Shepard Fairey", profile: "obey", age: "56", origin: "USA", style: .mural, link: "https://obeygiant.com")

let inv = Author(name: "Invader", profile: "inv", age: "57", origin: "France", style: .mosaic, link: "https://www.space-invaders.com/home/")

let satr = Author(name: "Satr", profile: "satr", origin: "Chine", style: .aerographical, link: "https://streetartcities.com/artists/satr")

let aero = Author(name: "Aero", profile: "aero", origin: "France", style: .aerographical, link: "https://streetartcities.com/artists/aero-1")

let jdl = Author(name: "JDL", profile: "jdl", age: "31", origin: "Pays-Bas", style: .mural, link: "https://jdlstreetart.com")

let kitsune = Author(name: "Kitsune Jolene", profile: "jolene", age: "34", origin: "Belgique", style: .mural, link: "https://www.kitsunejolene.com")

let authors = [kan, cite, seth, mahn, aerosol, obey, inv, satr, aero, jdl, kitsune]

//Enum des style
enum AuthorStyle : String, CaseIterable {
    case na = "N/A"
    case pointilism = "Pointillisme"
    case mural = "Mural"
    case mosaic = "Mosaïque"
    case aerographical = "Aérographe"
    case globepaiting = "Globepainter"
}

