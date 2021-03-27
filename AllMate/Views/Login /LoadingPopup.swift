//
//  LoadingPopup.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/26/21.
//

import SwiftUI

struct LoadingPopup: View {
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.35)
                .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black.opacity(0.7))
                .frame(width: 300, height: 300)
                .overlay(
                    Loader()
            )
        }
            
    }
}

struct Loader: View {
    
    @State var animate = false
    
    var body: some View {

        
        VStack {
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.red, .orange]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false))
            
            Text("Loading")
                .bold()
                .foregroundColor(.orange)
                .padding(.top)
                
                
            
        }
        .onAppear {
            self.animate.toggle()
        }
       
    }
}

struct LoadingPopup_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPopup()
    }
}
