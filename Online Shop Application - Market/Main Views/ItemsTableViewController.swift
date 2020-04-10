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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("we have selected", category!.name)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemToAddItemSeg" {
            
            let vc = segue.destination as! AddItemViewController
            vc.category = category!
            
        }
    }


}
