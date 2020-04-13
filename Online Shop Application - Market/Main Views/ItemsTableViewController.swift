//
//  ItemsTableViewController.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 9.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    //V19
    //MARK: - VARIABLES
    var category: Category?
    //V31
    var itemArray: [Item] = []
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        //V31
        tableView.tableFooterView = UIView()
        self.title = category?.name
        
        
        print("we have selected", category!.name)

    }
    //V31
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if category != nil {
            loadItems()
        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        cell.generateCell(itemArray[indexPath.row])
        return cell
    }
    
    //MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemToAddItemSeg" {
            
            let vc = segue.destination as! AddItemViewController
            vc.category = category!
            
        } else if segue.identifier == "ItemDetails" {
            let vc = segue.destination as! ItemViewController
            vc.item = sender as! Item
            
        }
    }
    
    //V32
    //MARK: - LOAD ITEMS
    private func loadItems() {
        //V33
        downloadItemsFromFirebase(category!.id) { (allItems) in
            
            self.itemArray = allItems
            self.tableView.reloadData()
            
        }
        
        
    }
    //V38
    //MARK: - TABLEVIEW DELEGATE

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ItemDetails", sender: itemArray[indexPath.row])
        
    }



}
