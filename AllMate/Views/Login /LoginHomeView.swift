//
//  WaveAnimation.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/24/21.
//

import SwiftUI

struct LoginHomeView: View {
    let universalSize = UIScreen.main.bounds
    
    @State var isAnimated = false
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottom) {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
                WavesAnimation()
                    
            
                VStack {
                    HStack {
                        Text("AllMate")
                            .foregroundColor(.white)
                            .font(Font.custom("Pacifico-Regular", size: 50))
                            .padding(.leading, 30)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Social Media for Students")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold, design: .default))
                        
                        Text("Collaborate with students in the same classes")
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.system(size: 23, weight: .medium, design: .default))
                    }
                    .frame(width: UIScreen.main.bounds.width - 60)
                    
                    NavigationLink(destination: Text("login")) {
         
      
                        RoundedRectangle(cornerRadius: 15)
                          .fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                            .overlay(
                                Text("Log In")
                                    .foregroundColor(.black)
                                    .padding(.vertical)
                                    .font(.system(size: 17, weight: .semibold, design: .default))
                                  )
      
                    }
                    .padding(.vertical)
                    
                    NavigationLink(destination: Text("sign up")) {
         
      
                        RoundedRectangle(cornerRadius: 15)
                          .stroke(Color.white, lineWidth: 2)
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                            .overlay(
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .font(.system(size: 17, weight: .semibold, design: .default))
                                  )
                     
                           
                           
                    }
                    
                    
                    
                    
                    
                }
            
            
        }
            .navigationBarHidden(true)
           
        }
        .onAppear(){
            self.isAnimated = true
        }
            
    }
    
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
        }
    
    }
}

struct WaveAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LoginHomeView()
    }
}
