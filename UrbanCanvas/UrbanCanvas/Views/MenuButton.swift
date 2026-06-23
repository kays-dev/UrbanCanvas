//
//  MenuButton.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 23/06/2026.
//

import SwiftUI

struct MenuButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(
                configuration.role == .destructive ? Color.accent : .mainText)
    }
}

struct PreviewButton : View{
    var body : some View{
        
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(MenuButton())
        
    }
}

#Preview {
    PreviewButton()
}
