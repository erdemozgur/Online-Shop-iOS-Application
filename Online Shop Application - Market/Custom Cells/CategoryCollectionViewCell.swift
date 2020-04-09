//
//  CategoryCollectionViewCell.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 9.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    //V14
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func generateCell(_ category: Category) {
        
        nameLabel.text = category.name
        imageView.image = category.image
        
    }
    
    
}
