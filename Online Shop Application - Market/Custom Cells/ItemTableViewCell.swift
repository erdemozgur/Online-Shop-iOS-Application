//
//  ItemTableViewCell.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 10.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

//V33
class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func generateCell(_ item: Item) {
        
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceLabel.text = convertToCurrency(item.price ?? 0.0)
        priceLabel.adjustsFontSizeToFitWidth = true
        
        //V34
        if item.imageLinks != nil && item.imageLinks.count > 0 {
            downloadImages(imageUrls: [item.imageLinks.first!]) { (images) in
                self.itemImageView.image = images.first
            }
        }
        
        
    }

}
