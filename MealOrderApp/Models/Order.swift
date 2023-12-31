//
//  Order.swift
//  MealOrderApp
//
//  Created by Fatih on 28.12.2023.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
