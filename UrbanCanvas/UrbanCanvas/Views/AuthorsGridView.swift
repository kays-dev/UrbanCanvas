//
//  AuthorGridView.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 24/06/2026.
//

import SwiftUI

struct AuthorsGridView: View {
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    let authorList : [Author] = authors.sorted{ $0.name < $1.name }
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(authorList){ author in
                    AuthorCard(author: author)
                }
            }
            .padding(.horizontal, 24)
        }
        .background(Color.bgGray.ignoresSafeArea())
        .scrollIndicators(.hidden)
    }
}

#Preview {
    AuthorsGridView()
}
