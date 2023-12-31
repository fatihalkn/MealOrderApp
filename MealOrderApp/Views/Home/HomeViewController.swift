//
//  HomeViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 26.12.2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefsCollectionView: UICollectionView!
    
    var categories: [DishCatagory] = []
    
    var populars: [Dish] = []
    
    var chefs: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        chefsCollectionView.delegate = self
        chefsCollectionView.dataSource = self
        
        registerCells()
        
        ProgressHUD.animate()
        NetworkService.shered.fetchAllCategories { [weak self] (result) in
            switch result {
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.chefs = allDishes.specials ?? []
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
        
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
            let controller = DishDetailViewController.instantiate()
            let listController = DishListesViewController.instantiate()

            switch collectionView {
            case categoryCollectionView:
                listController.catagory = categories[indexPath.row]
                navigationController?.pushViewController(listController, animated: true)
            case popularCollectionView:
                controller.dish = populars[indexPath.item]
                navigationController?.pushViewController(controller, animated: true)
            case chefsCollectionView:
                controller.dish = chefs[indexPath.item]
                navigationController?.pushViewController(controller, animated: true)
            default:
                break
            }
            
            
            
            
        }
    }
    
