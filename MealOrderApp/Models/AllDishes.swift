//
//  AllDishes.swift
//  MealOrderApp
//
//  Created by Fatih on 30.12.2023.
//

import Foundation


struct AllDishes: Decodable {
    let categories: [DishCatagory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
}
