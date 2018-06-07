//
//  ViewController.swift
//  ToDoList
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var taskDataManager: TaskDataManager?
    
    private var taskTableViewAdapter: TaskTableViewAdapter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupTableView()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TaskTableViewController {
    func setupTableView(){
        tableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        taskDataManager = TaskDataManager()
        taskTableViewAdapter = TaskTableViewAdapter(taskDataManager: taskDataManager!)
        
        tableView.dataSource = taskTableViewAdapter
        tableView.delegate = taskTableViewAdapter
    }
}
