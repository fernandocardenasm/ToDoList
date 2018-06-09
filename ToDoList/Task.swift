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
    let dueDateTimestamp: Double
}

struct TaskInputsValidator {
    
    func isTitleValid(title: String) -> Bool {
        
        if title == "" {
            return false
        }
        
        return true
    }
    
    //The datepicker always returns a valid date
    //activate this function if a certain timeinterval validation is necessary
//    func isDateValid(dueDate: Date) -> Bool {
//
//        return true
//    }
    
}
