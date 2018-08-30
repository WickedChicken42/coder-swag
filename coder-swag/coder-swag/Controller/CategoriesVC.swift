//
//  ViewController.swift
//  coder-swag
//
//  Created by James Ullom on 8/29/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import UIKit

// Added the UITableViewDataSource, UITableViewDelegate to support use of the TableView
class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set these properites to support the delegates for the TableView actions
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }

    // Required function for tabelview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return the data array's number of items
        return DataService.instance.getCategories().count
    }
    
    // Required function for tabelview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Make sure the Identifier is alos added to the TableViewCell Identifier property - MUST MATCH
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            // Get the appropriate Category from the array to line up with the cell/row in the TableView
            let category = DataService.instance.getCategories()[indexPath.row]
            // Don't set the View's properites directly - A View should manage itself so we created a function to handle setting up the view itself.
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    
    // The event used to grab the item that was selected in the CollectionView.
    // We then get the category and send it to the ProductsVC via performSegue to go to the next screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            // Set the back button text to empty so that only the arrow shows in the nav bar
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            
            // Initialize the product data in the ProductsVC
            assert(sender as? Category !=  nil)
            productsVC.initProducts(category: sender as! Category)

        }
    }
    
}

