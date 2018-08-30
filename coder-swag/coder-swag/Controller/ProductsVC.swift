//
//  ProductsVC.swift
//  coder-swag
//
//  Created by James Ullom on 8/29/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 
    // The var defined to allow us to set the datasource and delegate in the viewDidLoad
    @IBOutlet weak var productsCollection: UICollectionView!
    
    // The local current Product array variable for the VC
    private(set) public var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting the CollectionView properites to self for dataSource and delegate
        productsCollection.dataSource = self
        productsCollection.delegate = self
    }

    // Sets up the local product array var and sets the screen title
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
        
    }

    // Required to implement for the two added protocols
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    // Required to implement for the two added protocols - is called for each ProductCell to be loaded in the CollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get the ProductCell in the CollectionView at the given IndexPath.row
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            // Also get the product item at the same IndexPath.row
            let product = products[indexPath.row]
            // Update the ProductCell view with the product item
            cell.updateViews(product: product)
            // return the updated cell
            return cell
        } else {
            // Otherwise just return a new cell that is blank
            return ProductCell()
        }
    }
    

}

