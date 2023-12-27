//
//  DishPortraitCollectionViewCell.swift
//  MealOrderApp
//
//  Created by Fatih on 27.12.2023.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    static let identifier = "DishPortraitCollectionViewCell"
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        
    }
}
