//
//  TaskValidator.swift
//  ToDoListTests
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

import XCTest

@testable import ToDoList

class TaskValidator: XCTestCase {
    
    var validator: TaskInputsValidator!
    
    override func setUp() {
        super.setUp()
        validator = TaskInputsValidator()
        
    }
    
    func testIsTitleValid_WithBlankDescription_ReturnsFalse(){
        
        let title = ""
        
        XCTAssertEqual(validator.isTitleValid(title: title), false)
        
    }
    
    func testIsTitleValid_WithSomeDescription_ReturnsTrue() {
        
        let title = "Hola"
        
        XCTAssertEqual(validator.isTitleValid(title: title), true)
        
    }
    
    func testIsTimestampValid_WithSomeDate_ReturnsTrue() {
        let dueDate = 1234
        
        XCTAssertEqual(validator.isDateValid(dueDate: dueDate), true)
    }
    
    
}
