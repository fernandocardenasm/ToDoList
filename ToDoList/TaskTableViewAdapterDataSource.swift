//
//  TaskTableViewAdapterDataSource.swift
//  ToDoList
//
//  Created by Fernando on 07.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

extension TaskTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskDataManager.numberOfTasks(inSection: section)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return taskDataManager.titleOfSection(at: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        
        let task = taskDataManager.task(at: indexPath.row, inSection: indexPath.section)
        
        cell.configCell(with: task)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return taskDataManager.numberOfSections()
    }
    
}
