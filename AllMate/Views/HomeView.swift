//
//  HomeView.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("AllMate")
                    .font(Font.custom("Pacifico-Regular", size: 50))
                    .foregroundColor(Color.white.opacity(0.9))
                    .padding(.leading, 5)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                }
            }
            
           
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            
                           // Dummy data
                            ForEach((0...5), id: \.self) {
                                RecentWidgetView(name: "\($0)")
                            }
                            
                        }
                        .padding()
                    }
                    
                    ForEach(classesData, id: \.self) { userClass in
                        ClassView(followers: userClass.followers, messages: userClass.messages, posts: userClass.posts, title: userClass.title, image: userClass.image)
                    }
                    
                }
            }
            
            Spacer(minLength: 0)
        }
    }
}



struct Classes: Hashable {
    let followers: Int
    let messages: Int
    let posts: Int
    let title: String
    let image: String
    
    init(followers: Int, messages: Int, posts: Int, title: String, image: String) {
        self.followers = followers
        self.messages = messages
        self.posts = posts
        self.title = title
        self.image = image
    }
}

let classesData = [Classes(followers: 320, messages: 660, posts: 20, title: "AP Human Geography", image: "aphug"), Classes(followers: 600, messages: 1001, posts: 124, title: "AP World History", image: "apwh"), Classes(followers: 100, messages: 500, posts: 42, title: "AP Physics 1", image: "apphy1")]


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .background(Color.black.opacity(0.9).ignoresSafeArea(.all, edges: .all))
    }
}
