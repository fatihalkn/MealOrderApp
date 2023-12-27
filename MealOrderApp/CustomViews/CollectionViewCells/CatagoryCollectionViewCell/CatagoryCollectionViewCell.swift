//
//  CatagoryCollectionViewCell.swift
//  MealOrderApp
//
//  Created by Fatih on 26.12.2023.
//

import UIKit
import Kingfisher
class CatagoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var catagoryImageView: UIImageView!
    @IBOutlet weak var catagoryTitleLbl: UILabel!
    
    static let identifier = "CatagoryCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(catagory: DishCatagory) {
        catagoryTitleLbl.text = catagory.name
        catagoryImageView.kf.setImage(with: catagory.image?.asUrl)
        
    }

}
