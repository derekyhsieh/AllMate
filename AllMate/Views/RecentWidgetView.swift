//
//  RecentWidgetView.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct RecentWidgetView: View {
    var name: String
    var body: some View {
        RoundedRectangle(cornerRadius: 13.0)
            .stroke(Color(#colorLiteral(red: 0.9254901961, green: 0.4745098039, blue: 0.3019607843, alpha: 1)), lineWidth: 4.5)
            .frame(width: 70, height: 70)
            .overlay(
                Image(name)
                    .resizable()
                    .renderingMode(.original)
                    .cornerRadius(13)
                    .frame(width: 70, height: 70)
                    
            )
            
            
    }
}

struct RecentWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        RecentWidgetView(name: "0")
    }
}
