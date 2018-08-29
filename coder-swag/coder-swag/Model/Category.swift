//
//  Category.swift
//  coder-swag
//
//  Created by James Ullom on 8/29/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import Foundation

struct Category {
    // Make your set's private and your gets public to best protect the data
    private(set) public var title: String
    private(set) public var imageName: String

    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        
    }
}
