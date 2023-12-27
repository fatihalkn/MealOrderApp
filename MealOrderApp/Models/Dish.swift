//
//  Dish.swift
//  MealOrderApp
//
//  Created by Fatih on 27.12.2023.
//

import Foundation

struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
