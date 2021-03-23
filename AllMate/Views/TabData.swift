//
//  TabData.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/22/21.
//

import SwiftUI

struct TabItem: Hashable {
    var title: String!
    var imageName: String!
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

let tabs = [TabItem(title: "Home", imageName: "house"), TabItem(title: "Activity", imageName: "heart.fill"), TabItem(title: "Search", imageName: "magnifyingglass"), TabItem(title: "Profile", imageName: "person.fill")]
