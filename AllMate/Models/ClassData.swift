//
//  ClassData.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/27/21.
//

import Foundation
import SwiftUI

class ClassDataModel: ObservableObject {
    @Published var userPickedClasses: [String] = []
    
    let classes = [
        "AP Art and Design",
        "AP Art History",
        "AP Music Theory",
        "AP English Language and Composition",
        "AP English Literature and Composition",
        "AP Comparative Government and Politics",
        "AP European History",
        "AP Human Geography",
        "AP Macroeconomics",
        "AP Psychology",
        "AP United States Government and Politics",
        "AP United States History",
        "AP World History Modern",
        "AP Calculus AB",
        "AP Calculus BC",
        "AP Computer Science",
        "AP Computer Science Principles",
        "AP Statistics",
        "AP Biology"
    
    ]
    
    func loadUserPickedClasses() {
        userPickedClasses = UserViewModel().classes
    }
}




