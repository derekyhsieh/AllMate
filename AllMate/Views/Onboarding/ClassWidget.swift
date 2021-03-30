//
//  ClassWidget.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/27/21.
//

import SwiftUI

struct ClassWidget: View {
    var className: String
    let background: Color
    
    @State var isSelected = false
    @StateObject var classDataModel: ClassDataModel
    
    var body: some View {
        Capsule()
            .frame(width: UIScreen.main.bounds.width - 75, height: 75)
            .opacity(isSelected ? 0.5 : background == Color.black ? 0.3 : 0.1)
            .overlay(
                Text(className)
                    .foregroundColor(isSelected ? .white : background == Color.black ? Color.white.opacity(0.8) : .black)
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

struct ClassWidgetPicker: View {
    var className: String
    let background: Color
    
    @State var isSelected = false
    @StateObject var userViewModel: UserViewModel
    
    var body: some View {
        Capsule()
            .frame(width: UIScreen.main.bounds.width - 75, height: 75)
            .opacity(isSelected ? 0.5 : background == Color.black ? 0.3 : 0.1)
            .overlay(
                Text(className)
                    .foregroundColor(isSelected ? .white : background == Color.black ? Color.white.opacity(0.8) : .black)
                    .bold()
                    
            )
            .onTapGesture {
                isSelected.toggle()
                self.addOrDeleteClass(className: className)
            }
            .animation(.easeInOut)

    }
    
    func addOrDeleteClass(className: String) {
        if userViewModel.classes.contains(className) {
            let classToRemove = className
            userViewModel.classes.remove(object: classToRemove)
        } else {
            userViewModel.classes.append(className)
        }
    }

}

struct ClassWidget_Previews: PreviewProvider {
    static var previews: some View {
        ClassWidget(className: "AP Human Geography", background: Color.black, classDataModel: ClassDataModel())
    }
}
