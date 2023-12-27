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
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%2f", calories ?? 0)
    }
}
