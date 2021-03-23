//
//  TabButton.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var imageName: String
    var animation: Namespace.ID
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            
            withAnimation {
                selectedTab = title
            }
            
        }) {
            VStack(spacing: 6) {
                
                // slide out animation
                
                ZStack {
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: 45, height: 6)
                        
                    
                    if selectedTab == title {
                        CustomShape()
                            .fill(Color("tint"))
                            .frame(width: 45, height: 6)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                            
                    }
                }
                .padding(.bottom, 10)
                
               
                
                Image(systemName: imageName)
                    .foregroundColor(selectedTab == title ? Color("tint") : Color.black.opacity(0.2))
                    .frame(width: 24, height: 24)
                    .font(.system(size: 24))
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
            }
        }
    }
}
