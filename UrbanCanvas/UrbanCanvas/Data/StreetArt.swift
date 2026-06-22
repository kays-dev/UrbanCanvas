//
//  StreetArt.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 22/06/2026.
//

import Foundation

//Structure
struct StreetArt : Identifiable, Hashable{
    let id = UUID()
    
    let name: String
    var picture: String = "default"
    let detail: String
    
    let street: String
    let postCode: String
    let city: String
    let lat: CGFloat
    let long: CGFloat
    
    let type: ArtType
    let state: ArtState
    
    let author: String
    let created: DateComponents
}

//Enums
enum ArtType : String, CaseIterable{
    case all = "Tous"
    case harlftone = "Harlftone"
    case invader = "Invader"
    case mosaic = "Mosaïque"
    case mural = "Mural"
    case stencil = "Stencil"
    case calligraphy = "Calligraphie"
}

enum ArtState : String, CaseIterable{
    case all = "Toutes"
    case bad = "Mauvaise"
    case fair = "Convenable"
    case good = "Bonne"
    case perfect = "Parfaite"
}

//Instances
let artworks = [
    StreetArt(name: "La Joconde de Marseille", picture: "joconde", detail: """
        Dans le cadre de l’exposition « La Joconde, exposition immersive » au Palais de la Bourse à Marseille, coproduite par le Grand Palais Immersif et le Musée du Louvre, le MauMA : Musée des arts urbains de Marseille a donné « carte blanche » à l’artiste Kan / DMV pour la réalisation de l’œuvre « La Joconde de Marseille ». Produite et coordonnée par Méta 2, elle est la première représentation urbaine de la célèbre Monna Lisa au sein de la cité phocéenne.
        """, street: "Palais de la Bourse", postCode: "13001", city: "Marseille", lat: 43.2965, long: 5.3756, type: .harlftone, state: .good, author: "KAN DMV", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2022, month: 3)),
    StreetArt(name: "Les Canuts", picture: "canuts", detail: """
        L'une des trompe-l'œil les plus célèbres de France, peinte par la Cité de la Création sur un immeuble de la Croix-Rousse depuis 1987. La fresque représente une rue animée avec ses habitants, ses commerces et ses balcons fleuris, rendant hommage aux soyeux et aux traditions du quartier des canuts lyonnais.
        """, street: "Rue Denfert-Rochereau", postCode: "69004", city: "Lyon", lat: 45.7688, long: 4.8282, type: .mural, state: .perfect, author: "Cité de la Création", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 1987, month: 5)),
    StreetArt(name: "La Maison de Cécile", picture: "cecile", detail: """
        Immense fresque murale créée en 2021 par Seth (Julien Malland) en soutien à Cécile, commerçante depuis 43 ans rue Mouffetard, mise en difficulté par la crise du Covid. On y voit une petite fille dessinant une maison, symbole d'espoir et de résilience.
        """, street: "Rue Saint-Médard / Rue Mouffetard", postCode: "75005", city: "Paris", lat: 48.8436, long: 2.3510, type: .mural, state: .perfect, author: "Seth", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2021, month: 6)),
    StreetArt(name: "Chloé", picture: "chloe", detail: """
        Portrait au pochoir réalisé par C215 (Christian Guémy) dans le quartier du Panier. Fidèle à son style, l'artiste capture avec une précision photographique le regard d'une fillette, rendant hommage aux « invisibles » de la société. Les tons chauds et la flèche rouge signature de C215 contrastent avec la pierre blanche des ruelles marseillaises.
        """, street: "Rue du Panier", postCode: "13002", city: "Marseille", lat: 43.2991, long: 5.3701, type: .stencil, state: .good, author: "C215", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2019, month: 4)),
    StreetArt(name: "L'Éléphant de l'Île", picture: "elephant", detail: """
        Fresque murale en hommage aux Machines de l'Île, réalisée par Jef Aérosol à l'occasion du festival Estuaire. Un grand éléphant mécanique au pochoir noir et blanc arpente un pignon de l'île de Nantes, flèche rouge pointée vers la Loire.
        """, street: "Boulevard Léon Bureau", postCode: "44200", city: "Nantes", lat: 47.2065, long: -1.5601, type: .stencil, state: .good, author: "Jef Aérosol", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2016, month: 8)),
    StreetArt(name: "Le Mineur et l'Étoile", picture: "etoile", detail: """
        Fresque murale réalisée par Seth (Julien Malland) dans le quartier de Wazemmes. Un enfant mineur tend la main vers une étoile de charbon, symbole de l'histoire industrielle du bassin minier du Nord-Pas-de-Calais. Une œuvre empreinte de tendresse et de mémoire ouvrière.
        """, street: "Rue Jules Guesde", postCode: "59000", city: "Lille", lat: 50.6241 , long: 3.0524, type: .mural, state: .good, author: "Jef Aérosol", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2021, month: 10)),
    StreetArt(name: "Liberté Égalité Fraternité", picture: "liberty", detail: """
        Fresque monumentale réalisée par Shepard Fairey (Obey) en hommage aux victimes des attentats du Bataclan de novembre 2015. Une Marianne aux couleurs du drapeau français s'élève sur plusieurs étages, inspirée de l'affiche « Make Art Not War ». Une reproduction de l'œuvre orne aujourd'hui le bureau du président de la République.
        """, street: "190 Rue Nationale", postCode: "75013", city: "Paris", lat: 48.8336 , long: 2.3626, type: .calligraphy, state: .good, author: "Obey", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2016, month: 1)),
    StreetArt(name: "PA_278", picture: "pa", detail: """
        Mosaïque en carreaux de céramique colorés du street artiste Invader (Franck Slama), portant le numéro 278 de sa série parisienne. Inspirée des personnages pixelisés du jeu d'arcade Space Invaders (1978), cette pièce s'intègre discrètement au coin d'une façade du Marais.
        """, street: "Rue Beaubourg", postCode: "75004", city: "Paris", lat: 48.8604 , long: 2.3523, type: .invader, state: .fair, author: "Invader", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2008, month: 9)),
    StreetArt(name: "Chuuuut...", picture: "shhh", detail: """
        Œuvre monumentale réalisée en 2011 par Jef Aérosol (Jean-François Perroy) sur la place Igor Stravinsky, face au Centre Pompidou. Cet autoportrait de 22 mètres de haut représente l'artiste l'index sur les lèvres, invitant les passants à s'arrêter et à écouter la ville. Réalisée en cinq jours avec 200 bombes aérosol.
        """, street: "Place Igor Stravinsky", postCode: "75004", city: "Paris", lat: 48.8594 , long: 48.8594, type: .stencil, state: .perfect, author: "Jef Aérosol", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2011, month: 9)),
    StreetArt(name: "Le Tigre et la Cigale", picture: "tigre", detail: """
        Fresque murale réalisée par Satr (Deng Cunxin) sur un mur de la Friche la Belle de Mai. Un tigre de Sibérie se repose sous un pin tandis qu'une cigale provençale vole au-dessus de lui, dialogue poétique entre l'Orient et la Méditerranée. Peinte à la bombe aérosol lors d'une résidence artistique.
        """, street: "Friche la Belle de Mai, 41 Rue Jobin", postCode: "13003", city: "Marseille", lat: 43.3073, long: 5.3882, type: .mural, state: .good, author: "Satr", created: DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2022, month: 8))
]
