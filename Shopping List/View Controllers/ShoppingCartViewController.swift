//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        submitOrder.layer.cornerRadius = 4
        updateViews()
    }
    
    func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        
        let numberOfItemsInCart = shoppingItemController.shoppingItems.filter({ $0.isOnList }).count
        cartNumberLabel.text = "You have \(numberOfItemsInCart) item(s) in your shopping cart."
        nameTextField.text = ""
        addressTextField.text = ""
    }

    //MARK: -Actions
    
    @IBAction func submitOrder(_ sender: Any) {
        
        guard let address = addressTextField.text, !address.isEmpty,
            let name = nameTextField.text, !name.isEmpty else { return }
        
        updateViews()
        
        let alert = UIAlertController(title: "Order for \(name)", message: "Your items will be delivered in 15 minute(s).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in self.navigationController?.popToRootViewController(animated: true)}))
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: -Properties
    
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet var submitOrder: UIButton!
    @IBOutlet var cartNumberLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
}
