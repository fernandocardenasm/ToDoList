//
//  TaskDataManagerTableViewAdapter.swift
//  ToDoList
//
//  Created by Fernando on 07.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class TaskTableViewAdapter: NSObject {
    
    let taskDataManager: TaskDataManager
    
    init(taskDataManager: TaskDataManager) {
        self.taskDataManager = taskDataManager
    }
    
}
