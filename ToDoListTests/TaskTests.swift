//
//  TaskTests.swift
//  ToDoListTests
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest
@testable import ToDoList

class TasksTests: XCTestCase {
    
    func testInitialize_WithDescriptionAndDate_SetsNameAndDate(){
        let task = Task(title: "", dueDate: 1234)
        
        XCTAssertEqual(task.title, "")
        XCTAssertEqual(task.dueDate, 1234)
    }
    
}
