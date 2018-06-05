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
        let task = Task(description: "", timestamp: 123456)
        
        XCTAssertEqual(task.description, "")
        XCTAssertEqual(task.timestamp, 123456)
    }
    
}
