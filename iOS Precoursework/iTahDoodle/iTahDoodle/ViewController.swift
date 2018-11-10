//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Thomas Cowern New on 10/8/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!

    let todoList = ToDoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
//        print("Add to do item: \(itemTextField.text)")
        guard let todo = itemTextField.text else {
            return
        }
        
        if todo == "" {
            print("No item here")
        } else {
            todoList.add(todo)
            tableView.reloadData()
            itemTextField.text = ""
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}

