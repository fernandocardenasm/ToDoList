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
        
        XCTAssertFalse(validator.isTitleValid(title: title))
        
    }
    
    func testIsTitleValid_WithSomeDescription_ReturnsTrue() {
        
        let title = "Hola"
        
        XCTAssertTrue(validator.isTitleValid(title: title))
        
    }
    
    //To be refactor when a date must be validated
//    func testIsTimestampValid_WithSomeDate_ReturnsTrue() {
//        let dueDate = 1234
//
//        XCTAssertTrue(validator.isDateValid(dueDate: dueDate))
//    }
    
    
}
