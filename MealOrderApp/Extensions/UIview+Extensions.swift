//
//  UIview+Extensions.swift
//  MealOrderApp
//
//  Created by Fatih on 25.12.2023.
//

import UIKit

extension UIView {
    
    //MARK: - STORYBORDAKİ NEXT BUTONUNA RADİUS AÇTIM
    
 @IBInspectable  var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
