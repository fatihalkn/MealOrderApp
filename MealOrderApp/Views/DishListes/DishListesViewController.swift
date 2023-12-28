//
//  DishListesViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 28.12.2023.
//

import UIKit

class DishListesViewController: UIViewController {
    
    
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description:  "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 32),
        .init(id: "id2", name: "Garri 2", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 30),
        .init(id: "id3", name: "Garri 3", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31),
        .init(id: "id4", name: "Garri 4", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 88),
        .init(id: "id5", name: "Garri 5", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1002)
       
        
    ]

    @IBOutlet weak var tableView: UITableView!
    
    var catagory: DishCatagory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = catagory.name
        registerCells()
        
        tableView.dataSource = self
        tableView.delegate = self
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
