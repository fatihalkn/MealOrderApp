//
//  String+Extension.swift
//  MealOrderApp
//
//  Created by Fatih on 27.12.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
