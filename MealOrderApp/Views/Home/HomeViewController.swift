//
//  HomeViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 26.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var chefsCollectionView: UICollectionView!
    var categories: [DishCatagory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 32),
        .init(id: "id2", name: "Garri 2", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 30),
        .init(id: "id3", name: "Garri 3", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31),
        .init(id: "id4", name: "Garri 4", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 88),
        .init(id: "id5", name: "Garri 5", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1002)
 
    ]
    
    var chefs: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 32),
        .init(id: "id2", name: "Manto", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 30),
        .init(id: "id3", name: "Börek", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31),
        .init(id: "id4", name: "Lazanya", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 88),
        .init(id: "id5", name: "Dolma", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1002)
 
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        chefsCollectionView.delegate = self
        chefsCollectionView.dataSource = self
    }
    
   private func registerCells() {
       categoryCollectionView.register(UINib(nibName: CatagoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CatagoryCollectionViewCell.identifier)
       
       popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
       
       chefsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case chefsCollectionView:
            return chefs.count
        default: return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatagoryCollectionViewCell.identifier, for: indexPath) as! CatagoryCollectionViewCell
            cell.setup(catagory: categories[indexPath.row])
                return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case chefsCollectionView:
            let cell = chefsCollectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: chefs[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
            
        }
        
    }
    
    
}
