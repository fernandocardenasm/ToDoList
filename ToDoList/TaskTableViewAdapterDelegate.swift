//
//  TaskTableViewAdapterDelegate.swift
//  ToDoList
//
//  Created by Fernando on 07.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

extension TaskTableViewAdapter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        taskDataManager.removeTask(at: indexPath.row, inSection: indexPath.section)
        
        //According to the documentation this should be not called in the same function. For the initial test is ok.
        tableView.reloadData()
    }
    
}
