//
//  ItemViewController.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 13.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit
import JGProgressHUD

class ItemViewController: UIViewController {
    //V37
    //MARK: - IBOUTLETS
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var item: Item!
    var itemImages: [UIImage] = []
    let hud = JGProgressHUD(style: .dark)
    
    
    //MARK: - VIEW LIFECYCLE


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Item name is", item.name!)
        setupUI()
    }
    
    private func setupUI() {
        
        priceLabel.text = convertToCurrency(item.price ?? 0.0)
        nameLabel.text = item.name
        descriptionTextView.text = item.description
        
    }
    

}
