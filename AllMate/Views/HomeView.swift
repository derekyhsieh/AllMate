//
//  HomeView.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @ObservedObject var classDataModel = ClassDataModel()
    @State private var showClassPickerView = false
    
    var body: some View {
        ZStack {
        
        VStack(spacing: 10) {
            HStack {
                Text("AllMates")
                    .font(Font.custom("Pacifico-Regular", size: 50))
                    .foregroundColor(Color("FontColor").opacity(0.9))
                    .padding(.leading, 5)
                Spacer()
                
                Button(action: {
                    
                    showClassPickerView = true
                    
                }) {
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color("FontColor").opacity(0.9))
                        .padding(.trailing, 5)
                }
          
            }
            
           
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 20) {
//
//                           // Dummy data
//                            ForEach((0...5), id: \.self) {
//                                RecentWidgetView(name: "\($0)")
//                            }
//
//                        }
//                        .padding()
//                    }
                    
                    ForEach(userViewModel.classes, id: \.self) { userClass in
                        ClassView(followers: 31, messages: 293, posts: 1002, title: userClass, image: userClass)
                    }
                    
                }
            }
            
            Spacer(minLength: 0)
        }
         
            UserClassPickerView(userViewModel: userViewModel, show: $showClassPickerView, backgroundColor: Color.black).edgesIgnoringSafeArea(.all).background(Color(#colorLiteral(red: 0.039206855, green: 0.04314254224, blue: 0.04704723507, alpha: 1)))
                .offset(y: showClassPickerView ? 0 : -UIScreen.main.bounds.height)
                .animation(.spring())
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




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .background(Color.black.opacity(0.9).ignoresSafeArea(.all, edges: .all))
    }
}
