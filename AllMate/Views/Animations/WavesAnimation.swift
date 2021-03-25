//
//  WavesAnimation.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/24/21.
//

import SwiftUI

struct WavesAnimation: View {
    
    let universalSize = UIScreen.main.bounds
    
    @State var isAnimated = false
    var body: some View {
        
        ZStack {
            getSinWave(interval: universalSize.width, amplitude: 175, baseline: -50 + universalSize.height/2)
                .foregroundColor(Color(#colorLiteral(red: 0.1718919575, green: 0.1719278395, blue: 0.171887219, alpha: 1)).opacity(0.8))
                .offset(x: isAnimated ? -1*universalSize.width : 0)
            .animation(
                Animation.linear(duration: 8)
                .repeatForever(autoreverses: false)
            )
            getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color(#colorLiteral(red: 0.1817524135, green: 0.1806787848, blue: 0.1825820804, alpha: 1)).opacity(0.7))
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
            .animation(
                Animation.linear(duration: 10)
                .repeatForever(autoreverses: false)
            )
            
            getSinWave(interval: universalSize.width*1.2, amplitude: 175, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.4))
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
            .animation(
                Animation.linear(duration: 15)
                .repeatForever(autoreverses: false)
            )
        }.onAppear(){
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


struct WavesAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WavesAnimation()
            .background(Color.black).edgesIgnoringSafeArea(.all)
    }
}
