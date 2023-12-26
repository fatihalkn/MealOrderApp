//
//  CatagoryCollectionViewCell.swift
//  MealOrderApp
//
//  Created by Fatih on 26.12.2023.
//

import UIKit

class CatagoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var catagoryImageView: UIImageView!
    @IBOutlet weak var catagoryTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        func setup(catagory: DishCatagory) {
            
        }
        
    }

}
