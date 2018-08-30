//
//  Product.swift
//  coder-swag
//
//  Created by James Ullom on 8/29/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import Foundation

struct Product {
    // The struct's local variables with the SET made private but the GET is public
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    // The initializer function that allows the local vars to be set
    init(title: String, price: String, imageName: String) {

        self.title = title
        self.price = price
        self.imageName = imageName
        
    }
}
