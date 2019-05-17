//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
            itemNameLabel.text = shoppingItem.name
            imageView.image = UIImage(named: shoppingItem.image)
        
        if shoppingItem.isOnList == true {
            addedLabel.text = "Added"
        } else {
            addedLabel.text = "Not Added"
        }
    }
    
    
    //MARK: -Properties
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var addedLabel: UILabel!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
}
