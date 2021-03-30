//
//  ClassView.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct ClassView: View {
    
    let followers: Int
    let messages: Int
    let posts: Int
    let screen = UIScreen.main.bounds.size
    let title: String
    let image: String
    
    var body: some View {
      
            
        ZStack(alignment: .topLeading) {
          
            
            Image(image)
                        .resizable()
                .scaledToFit()
                        .cornerRadius(23)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 26)
                                .fill(Color(#colorLiteral(red: 0.9803921569, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                                
                                HStack {
                                    HStack(spacing: 0) {
                                        Image(systemName: "heart.fill")
                                            .font(.system(size: 25))
                                            .foregroundColor(.red)
                                        
                                        Text("\(followers)")
                                            .font(.system(size: 15, weight: .regular, design: .rounded))
                                            .foregroundColor(.red)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 0) {
                                        Image(systemName: "message.fill")
                                            .font(.system(size: 25))
                                            .foregroundColor(.blue)
                                        
                                        Text("\(messages)")
                                            .font(.system(size: 15, weight: .regular, design: .rounded))
                                            .foregroundColor(.blue)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 0) {
                                        Image(systemName: "square.and.pencil")
                                            .font(.system(size: 25))
                                            .foregroundColor(.black)
                                        
                                        Text("\(posts)")
                                            .font(.system(size: 15, weight: .regular, design: .rounded))
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .frame(width: 309, height: 52)
                                .offset(y: 110)
                            
                    )
            
            
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
            
            .padding(8)
        }
        .frame(width: screen.width - 30, height: 300)
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView(followers: 320, messages: 630, posts: 20, title: "AP Human Geography", image: "AP Human Geography")
            
    }
}
