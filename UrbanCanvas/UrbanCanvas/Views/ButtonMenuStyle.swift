//
//  MenuButton.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 23/06/2026.
//

import SwiftUI

struct ButtonMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
                    .border(Color.red)
//        configuration.label
//            .padding(.horizontal, 24)
//            .padding(.vertical, 16)
//            .background(.gray)
//            .foregroundStyle(.mainText)
//            .bold()
//            .clipShape(Capsule())
    }
}

struct PreviewMenuStyle : View{
    var body : some View{
        
        Menu("Test"){
            Button{
            } label : {
                Text("Liste des filtres")
                    .foregroundStyle(.mainText)
                    .font(.subheadline)
                
                Text("Choisissez un type d’art")
                    .font(.callout)
                    .foregroundStyle(.mainText)
            }
            .buttonStyle(MenuButton())
        }.menuStyle(ButtonMenuStyle())
        
    }
}

#Preview {
    PreviewMenuStyle()
}
