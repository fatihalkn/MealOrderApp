//
//  DishCatagory.swift
//  MealOrderApp
//
//  Created by Fatih on 26.12.2023.
//

import Foundation

struct DishCatagory: Decodable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id 
        case name = "title"
        case image
    }
}
