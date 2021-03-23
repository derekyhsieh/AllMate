//
//  CustomShape.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

