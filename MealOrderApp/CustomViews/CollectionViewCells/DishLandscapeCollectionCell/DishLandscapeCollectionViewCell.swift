//
//  DishLandscapeCollectionViewCell.swift
//  MealOrderApp
//
//  Created by Fatih on 27.12.2023.
//

import UIKit

class DishLandscapeCollectionViewCell:
    UICollectionViewCell {
    
    static let identifier = "DishLandscapeCollectionViewCell"
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descripLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImage.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descripLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        
    
    }

}
