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
            
           
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        
                       // Dummy data
                        ForEach((0...5), id: \.self) {
                            RecentWidgetView(name: "\($0)")
                        }
                        
                    }
                    .padding(.horizontal)
                }
                
                
                
            }
            
            Spacer(minLength: 0)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .background(Color.black.opacity(0.9).ignoresSafeArea(.all, edges: .all))
    }
}
