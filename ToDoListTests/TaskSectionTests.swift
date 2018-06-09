//
//  TaskSectionTests.swift
//  ToDoListTests
//
//  Created by Fernando on 09.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class TaskSectionTests: XCTestCase {
    
    func testNumberOfSections_IsThree() {
        
        XCTAssertEqual(TaskSection.numberOfSections, 3)
        
    }
    
    func testInit_WithDatePlusMinusTwo_ReturnsNow() {
        let date = Date().plus(numberOfDays: -2)
        
        XCTAssertEqual(TaskSection(forTaskDueDate: date) , .Now)
    }
    
    func testInit_WithDatePlusTwo_ReturnsNow() {
        let date = Date().plus(numberOfDays: 2)
        
        XCTAssertEqual(TaskSection(forTaskDueDate: date) , .Now)
    }
    
    func testInit_WithDatePlusFour_ReturnsSoon() {
        let date = Date().plus(numberOfDays: 4)
        
        XCTAssertEqual(TaskSection(forTaskDueDate: date) , .Soon)
    }
    
    func testInit_WithDatePlusSix_ReturnsUpcoming() {
        let date = Date().plus(numberOfDays: 6)
        
        XCTAssertEqual(TaskSection(forTaskDueDate: date) , .Upcoming)
    }
    
    func testIndexForNow_IsZero() {
        XCTAssertEqual(TaskSection.Now.rawValue , 0)
    }
    
    func testIndexForSoon_IsOne() {
        XCTAssertEqual(TaskSection.Soon.rawValue , 1)
    }
    
    func testIndexForUpcoming_IsTwo() {
        XCTAssertEqual(TaskSection.Upcoming.rawValue , 2)
    }
    
}
