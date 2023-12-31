//
//  Route.swift
//  MealOrderApp
//
//  Created by Fatih on 29.12.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    var description: String {
        switch self {
            
        case .fetchAllCategories: 
            return "/dish-categories"
        case .placeOrder(let dishId): 
            return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId): 
            return "/dishes/\(categoryId)"
        }
        
    }
}
