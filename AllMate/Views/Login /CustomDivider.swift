//
//  CustomDivider.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/25/21.
//

import SwiftUI

struct CustomDivider: View {
    let color: Color
    let width: CGFloat = 2
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(height: width)
    }
}

