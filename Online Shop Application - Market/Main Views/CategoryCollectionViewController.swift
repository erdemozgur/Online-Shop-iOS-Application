//
//  CategoryCollectionViewController.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 9.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoryCollectionViewController: UICollectionViewController {
    
    //V13
    //MARK: - VARIABLES
    var categoryArray: [Category] = []
    //V15
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 5.0, bottom: 20.0, right: 5.0)
    private let itemsPerRow: CGFloat = 3
    
    //MARK: - VIEW LIFECYLCE
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    //V13
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadCategories()
    }



    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //V13
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
        //V14
        let category = categoryArray[indexPath.row]
        cell.generateCell(category)
        
        return cell
    }
    
    //MARK: - DOWNLOAD CATEGORIES
    //V13
    private func loadCategories() {
        
        downloadCategoriesFromFirebase { (allCategories) in

            self.categoryArray = allCategories
            self.collectionView.reloadData()
        }
        
    }
    //MARK: - UICollectionViewDelegate
    //V19
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "CategoryToItemsSeg", sender: categoryArray[indexPath.row])
        
    }
    //MARK - NAVIGATION
    //V19
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CategoryToItemsSeg" {
            
            let vc = segue.destination as! ItemsTableViewController
            vc.category = sender as! Category
        }
        
    }

}

//V15
extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: 100 , height: 100)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
        
    }
    
}
