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
    
    // Define static category data
    private let categories = [Category(title: "SHIRTS", imageName: "shirts.png"),
                              Category(title: "HOODIES", imageName: "hoodies.png"),
                              Category(title: "HATS", imageName: "hats.png"),
                              Category(title: "DIGITAL", imageName: "digital.png")]
    
    // Define static products data
    private let hats = [Product(title: "Devslopes Logo Graphic Beanie", price: "$18", imageName: "hat01.png"),
                        Product(title: "Developes Logo Hat Black", price: "$22", imageName: "hat02.png"),
                        Product(title: "Devslopes Logo Hat White", price: "$22", imageName: "hat03.png"),
                        Product(title: "Devslopes Logo Snapback", price: "$20", imageName: "hat04.png")
    ]

    private let hoodies = [Product(title: "Devslopes Logo Hoodie Grey", price: "$32", imageName: "hoodie01.png"),
                           Product(title: "Devslopes Logo Hoodie Red", price: "$32", imageName: "hoodie02.png"),
                           Product(title: "Devslopes Hoodie Grey", price: "$32", imageName: "hoodie03.png"),
                           Product(title: "Devslopes Hoodie Black", price: "$32", imageName: "hoodie04.png")
    ]
    
    private let shirts = [Product(title: "Devslopes Logo Shirt Black", price: "$18", imageName: "shirt01.png"),
                          Product(title: "Devslopes Badge Shirt Light Grey", price: "$19", imageName: "shirt02.png"),
                          Product(title: "Devslopes Logo Shirt Red", price: "$18", imageName: "shirt03.png"),
                          Product(title: "Hustle Delegate Grey", price: "$18", imageName: "shirt04.png"),
                          Product(title: "Kickflip Studios Black", price: "$18", imageName: "shirt05.png")
    ]
    
    // This is an empty array as there are currently no digital goods
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }

    // Returns the appropriate product array based on the passed in category title
    func getProducts(forCategoryTitle title: String) -> [Product] {
        switch title.uppercased() {
        case "HATS":
            return getHats()
        case "HOODIES":
            return getHoodies()
        case "SHIRTS":
            return getShirts()
        case "DIGITAL":
            return getDigitialGoods()
        default:
            return getShirts()
        }
    }

    // These four functions return the actual product array
    func getHats() -> [Product] {
        return hats
    }
    
    func getHoodies() -> [Product] {
        return hoodies
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    
    func getDigitialGoods() -> [Product] {
        return digitalGoods
    }
    
}

