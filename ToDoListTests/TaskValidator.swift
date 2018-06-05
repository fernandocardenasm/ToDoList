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
    
    func testIsDescriptionValid_WithBlankDescription_ReturnsFalse(){
        
        let description = ""
        
        XCTAssertEqual(validator.isDescriptionValid(description: description), false)
        
    }
    
    func testIsDescriptionValid_WithSomeDescription_ReturnsTrue() {
        
        let description = "Hola"
        
        XCTAssertEqual(validator.isDescriptionValid(description: description), true)
        
    }
    
    func testIsTimestampValid_WithZero_ReturnsFalse() {
        let timestamp = 0
        
        XCTAssertEqual(validator.isDateValid(timestamp: timestamp), false)
        
    }
    
    func testIsTimestampValid_WithSomeNumber_ReturnsTrue() {
        let timestamp = 1528199649
        
        XCTAssertEqual(validator.isDateValid(timestamp: timestamp), true)
    }
    
    
}
