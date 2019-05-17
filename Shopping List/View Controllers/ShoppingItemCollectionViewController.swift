//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ListCell"

class ShoppingItemCollectionViewController: UICollectionViewController {

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemController.update(shoppingItem: shoppingItemController.shoppingItems[indexPath.item])
        collectionView.reloadItems(at: [indexPath])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCart" {
            guard let destinationVC = segue.destination as? ShoppingCartViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        }
    }
 

    // MARK: UICollectionViewDataSource
    
    //Stretch Goal - Separating added/ not added items
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let shoppingItemCollectionCell = cell as? ShoppingItemCollectionViewCell else {
            print("Error in Cell Type")
            return cell
        }
        shoppingItemCollectionCell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item] 
        return cell
    }
    
    //MARK: Stretch Goal - Separating added/ not added items
//    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
//        let added = shoppingItemController.addedItems.isEmpty ? nil : "Added Items"
//        let unadded = shoppingItemController.unaddedItems.isEmpty ? nil : "Not Added Items"
//        
//        return section == 0 ? added : unadded
//    }

    //MARK: -Properties
    
    var shoppingItemController = ShoppingItemController()
}
