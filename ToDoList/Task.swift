//
//  Task.swift
//  ToDoList
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

struct Task {
    let description: String
    let timestamp: Int
}

struct TaskInputsValidator {
    
    func isDescriptionValid(description: String) -> Bool {
        
        if description == "" {
            return false
        }
        
        return true
    }
    
    func isDateValid(timestamp: Int) -> Bool {
        if timestamp > 0 {
            return true
        }
        return false
    }
    
}
