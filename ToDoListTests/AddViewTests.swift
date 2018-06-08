//
//  AddViewTests.swift
//  ToDoListTests
//
//  Created by Fernando on 08.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest
@testable import ToDoList

class AddViewTests: XCTestCase {
    
    var sut: AddView!
    
    override func setUp() {
        super.setUp()
        sut = AddView()
    }
    
    func testHasTitleTextField(){
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut))
    }
    
    func testHasDueDateDatePicker() {
        XCTAssertTrue(sut.dueDateDatePicker.isDescendant(of: sut))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
}
