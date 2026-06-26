//
//  AuthorCard.swift
//  UrbanCanvas
//
//  Created by Apprenant174 on 24/06/2026.
//

import SwiftUI

struct AuthorCard: View {
    @Environment(\.openURL) private var openURL
    
    let author : Author
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            if author.profile != "" {
                Image(author.profile)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0,
                           maxWidth: .infinity
                    )
                    .aspectRatio(1/1, contentMode: .fit)
                    .frame(height : 68)
                    .clipShape(Circle())
                    .padding(.top, 12)
            } else {
                Circle()
                    .fill(.bgGray)
                    .overlay(alignment: .center){
                        Image(systemName: "person.slash.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0,
                                   maxWidth: .infinity
                            )
                            .aspectRatio(1/1, contentMode: .fit)
                            .padding(.leading, 16)
                            .padding(.trailing, 14)
                    }
                    .frame(height : 68)
                    .padding(.top, 12)
            }
            
            
            Text(author.name)
                .font(.callout)
                .bold()
                .foregroundStyle(.accent)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            VStack{
                Text(
            """
            \(Text("Age : ").bold())\
            \(author.age != "NC" ? Text(author.age + " ans")  : Text(author.age)) 
            """
                )
                
                Text(
            """
            \(Text("Origines : ").bold())\
            \(Text(author.origin))
            """
                )
                
                Text(
            """
            \(Text("Style : ").bold())\
            \(Text(author.style.rawValue))
            """
                )
            }
            .font(.footnote)
            
            Button{
                if let authorLink = URL(string: author.link!) {
                    
                    openURL(authorLink, prefersInApp: true)
                }
                    
                } label : {
                    Text("Site web")
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(.secondOrange)
                        }
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .bold()
                }
                
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 240)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background{
                RoundedRectangle(cornerRadius: 28)
                    .fill(.white)
            }
        }
    }
    
    #Preview {
        AuthorCard(author: authors[0])
    }
