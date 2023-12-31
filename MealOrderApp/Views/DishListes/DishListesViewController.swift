//
//  DishListesViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 28.12.2023.
//

import UIKit
import ProgressHUD

class DishListesViewController: UIViewController {
    
    
    
    var dishes: [Dish] = []

    @IBOutlet weak var tableView: UITableView!
    
    var catagory: DishCatagory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = catagory.name
        registerCells()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ProgressHUD.animate()
        NetworkService.shered.fetchCategoryDishes(catagoryId: catagory.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

    

}

extension DishListesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
