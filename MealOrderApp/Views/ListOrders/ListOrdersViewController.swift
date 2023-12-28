//
//  ListOrdersViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 28.12.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var oreders: [Order] = [
        .init(id: "id", name: "Fatih Alkan", dish: .init(id: "id3", name: "Börek", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31)),
        .init(id: "id", name: "Hülya Alkan", dish: .init(id: "id3", name: "Sarma", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31)),
        .init(id: "id", name: "Fatih Alkan", dish: .init(id: "id3", name: "Mantı", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31)),
        .init(id: "id", name: "Ekrem Alkan", dish: .init(id: "id3", name: "Pizza", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31)),
        .init(id: "id", name: "Yusuf Alkan", dish: .init(id: "id3", name: "Elma", description: "This the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 31))

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        title = "Orders"
       registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }


    

}

extension ListOrdersViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oreders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: oreders[indexPath.row])
        return cell
    }
    
    
}
