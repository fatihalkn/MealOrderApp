//
//  ApiResponse.swift
//  MealOrderApp
//
//  Created by Fatih on 30.12.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
