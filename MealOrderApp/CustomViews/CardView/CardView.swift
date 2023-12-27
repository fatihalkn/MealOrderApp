//
//  CardView.swift
//  MealOrderApp
//
//  Created by Fatih on 27.12.2023.
//

import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialStup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialStup()
        
    }
    private func initialStup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
