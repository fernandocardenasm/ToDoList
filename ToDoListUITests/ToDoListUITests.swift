//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

class ToDoListUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        
        let app = XCUIApplication()
        app.navigationBars["ToDoList.TaskTableView"].buttons["Add"].tap()
        app.textFields["Add your task here"].tap()
        app.textFields["Add your task here"].typeText("Uni Testing Task")
        
        let datePickersQuery = app.datePickers
        datePickersQuery.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "September")
        datePickersQuery.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "July")
        datePickersQuery.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "18")
        datePickersQuery.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "2019")
        datePickersQuery.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "2018")

        app.navigationBars["New Task"].buttons["Done"].tap()
        
    }
    
}
