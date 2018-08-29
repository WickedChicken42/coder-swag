//
//  DataService.swift
//  coder-swag
//
//  Created by James Ullom on 8/29/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import Foundation

// Create a Singleton class for the Data Service so that there is only ever one in memory
class DataService {
    static let instance = DataService()
    
    private let categories = [Category(title: "SHIRTS", imageName: "shirts.png"),
                              Category(title: "HOODIES", imageName: "hoodies.png"),
                              Category(title: "HATS", imageName: "hats.png"),
                              Category(title: "DIGITAL", imageName: "digital.png")]
    
    func getCategories() -> [Category] {
        return categories
    }
}
