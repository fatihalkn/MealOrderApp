//
//  DishDetailViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 28.12.2023.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptinLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
   
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    populateView()

    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptinLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    @IBAction func placeOrderBtnCliced(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
                !name.isEmpty else {
            ProgressHUD.error("Please Enter Your Name ")
            
            return
        }
        ProgressHUD.animate("Placing Order...")
        NetworkService.shered.placeOrder(dishId: dish.id ?? "", name: name) {  (result) in
            switch result {
            
            case .success(_):
                ProgressHUD.success("Your order has been received 👨‍🍳")
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
   

}
