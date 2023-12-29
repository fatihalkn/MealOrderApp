//
//  AppError.swift
//  MealOrderApp
//
//  Created by Fatih on 29.12.2023.
//

import Foundation


enum AppError: LocalizedError {
    case  errorDecoding
    case  unknowError
    case  invalidUrl
    case  serverError(String)
    
    var errorDescription: String? {
        switch self {
        
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknowError:
            return "Bruhhhh!!!! I have no idea what ho on"
        case .invalidUrl:
            return "HEYYY Give me  a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
