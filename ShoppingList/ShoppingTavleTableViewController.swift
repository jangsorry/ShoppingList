//
//  ShoppingTavleTableViewController.swift
//  ShoppingList
//
//  Created by 지성 on 2021/10/31.
//

import UIKit

class ShoppingTavleTableViewController: UITableViewController {

    var list: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet var textFiled: UITextField!
    @IBOutlet var HeaderView: UIView!
    @IBOutlet var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        if let text = textFiled.text{
            list.append(text)
            
            print(list)
        } else {
            print("ERROR")
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingTableViewCell") else {
            return UITableViewCell()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 44 : 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if editingStyle == .delete {
                list.remove(at: indexPath.row)
            }
        }
    }

    
}
