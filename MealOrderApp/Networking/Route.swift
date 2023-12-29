//
//  Route.swift
//  MealOrderApp
//
//  Created by Fatih on 29.12.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    case temp
    var description: String {
        switch self {
            
        case .temp: return "/dish-categories"
            
        }
        
    }
}
