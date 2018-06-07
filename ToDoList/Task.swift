//
//  Task.swift
//  ToDoList
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

struct Task: Equatable {
    let title: String
    let dueDate: Int
}

struct TaskInputsValidator {
    
    func isTitleValid(title: String) -> Bool {
        
        if title == "" {
            return false
        }
        
        return true
    }
    
    func isDateValid(dueDate: Int) -> Bool {
        return true
    }
    
}
