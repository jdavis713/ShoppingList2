//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var image: String
    var isOnList: Bool
    
    init(name: String, image: String, isOnList: Bool = false) {
        self.name = name
        self.image = image
        self.isOnList = isOnList
    }
}
