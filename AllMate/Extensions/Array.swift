//
//  Array.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/28/21.
//

import Foundation

extension Array where Element: Equatable {

 // Remove first collection element that is equal to the given `object`:
 mutating func remove(object: Element) {
     guard let index = firstIndex(of: object) else {return}
     remove(at: index)
 }

}
