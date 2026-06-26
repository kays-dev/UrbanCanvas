# UrbanCanvas 🎨

Application iOS de référencement et de découverte du street art en France, développée en Swift / SwiftUI dans le cadre d'une formation AFP Advanced chez Simplon.

---

## Aperçu

UrbanCanvas permet d'explorer un catalogue d'œuvres de street art à travers la France — fresques murales, pochoirs, mosaïques, calligraphies — en proposant une expérience de découverte progressive : liste, carte, fiches auteur·ices, et missions de découverte.

---

## Fonctionnalités

### V1 — Référencement et Consultation
- Liste verticale des œuvres avec nom, image miniature et lieu
- Vue détail complète : titre, description, image pleine largeur, type d'art, état de conservation, date de création, auteur·ice et localisation

### V2 — Tri et Filtrage
- Bouton de filtrage en haut à droite de l'écran principal
- Filtrage dynamique par type d'art, mis à jour immédiatement sur la vue liste

### V3 — Exploration Cartographique
- Segmented Control (Picker) pour basculer entre la vue liste et la vue carte
- Tap sur un point d'intérêt sur la carte : aperçu partiel (image, titre, début de description)
- Navigation depuis l'aperçu vers la fiche détail complète

### V4 — Découverte des Auteur·ices
- Navigation principale par onglets (TabView)
- Répertoire des artistes : nom, âge, origines, style de prédilection, photo de profil

### V5 — Missions de Découverte
- Génération automatique d'une sélection de 3 à 5 œuvres
- Contraintes de sélection :
  - Pas de doublon d'œuvre
  - Pas de doublon d'auteur·ice
  - Au moins 2 types d'art différents
- Affichage sous forme de cartes numérotées avec les informations principales
- Navigation vers la fiche détail depuis chaque carte de mission
- Marquage d'une œuvre comme "découverte" depuis la carte
- Suivi de progression en temps réel (ex : "2 œuvres découvertes sur 5")
- Message de réussite à la fin de la mission
- Génération d'une nouvelle mission depuis l'écran de fin

---

## Stack technique

| Technologie | Usage |
|---|---|
| Swift 6 | Langage principal |
| SwiftUI | Interface utilisateur |
| MapKit | Vue cartographique |
| SF Symbols | Iconographie |
| GlassEffect | Effets visuels (iOS 26+) |

---

## Installation

1. Cloner le dépôt
```bash
git clone https://github.com/ton-username/UrbanCanvas.git
```
2. Ouvrir `UrbanCanvas.xcodeproj` dans Xcode 16+
3. Sélectionner un simulateur iOS 26+ ou un device physique
4. Build & Run (⌘R)

---

## Auteur

Développé par **kays-dev** dans le cadre de la formation **AFP Advanced — Simplon**, juin 2026.
