//
//  ModelData.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import Foundation
import SwiftUI

class ModelView: ObservableObject {
    
    @Published var isActivityLoaded = false
    @Published var isSearchLoaded = false
    @Published var isProfileLoaded = false
    
    init() {
        print("Home Data Loaded")
        
    }
    
    func loadActivity() {
        print("activity loaded")
        isActivityLoaded = true
    }
    
    func loadSearch() {
        print("search loaded")
        isSearchLoaded = true
    }
    
    func loadProfile() {
        print("profile loaded")
        isProfileLoaded = true
    }
    
    
}
