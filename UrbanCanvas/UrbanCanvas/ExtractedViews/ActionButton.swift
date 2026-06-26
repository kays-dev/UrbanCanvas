//
//  ActionButton.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 26/06/2026.
//

import SwiftUI

struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .font(.footnote)
            .bold()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .contentShape(.capsule)
            .glassEffect(.regular.tint(.secondOrange), in : .rect(cornerRadius: 28.0))
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(ActionButton())
}

