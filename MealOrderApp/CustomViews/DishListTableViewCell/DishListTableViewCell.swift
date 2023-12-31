//
//  DishListTableViewCell.swift
//  MealOrderApp
//
//  Created by Fatih on 28.12.2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = "DishListTableViewCell"
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var decriptionLbl: UILabel!
    
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        decriptionLbl.text = dish.description
        
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        decriptionLbl.text = order.name
    }
}
