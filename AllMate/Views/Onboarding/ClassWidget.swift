//
//  ClassWidget.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/27/21.
//

import SwiftUI

struct ClassWidget: View {
    var className: String
    
    @State var isSelected = false
    @StateObject var classDataModel: ClassDataModel
    
    var body: some View {
        Capsule()
            .frame(width: UIScreen.main.bounds.width - 75, height: 75)
            .opacity(isSelected ? 0.5 : 0.1)
            .overlay(
                Text(className)
                    .foregroundColor(isSelected ? .white : .black)
                    .bold()
                    
            )
            .onTapGesture {
                isSelected.toggle()
                self.addOrDeleteClass(className: className)
            }
            .animation(.easeInOut)
    }
    
    func addOrDeleteClass(className: String) {
        if classDataModel.userPickedClasses.contains(className) {
            let classToRemove = className
            classDataModel.userPickedClasses.remove(object: classToRemove)
        } else {
            classDataModel.userPickedClasses.append(className)
        }
    }

}

struct ClassWidget_Previews: PreviewProvider {
    static var previews: some View {
        ClassWidget(className: "AP Human Geography", classDataModel: ClassDataModel())
    }
}
