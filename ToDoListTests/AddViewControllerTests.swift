//
//  AddViewControllerTests.swift
//  ToDoListTests
//
//  Created by Fernando on 08.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class AddViewControllerTests: XCTestCase {
    
    var sut: AddViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = AddViewController()
        sut.loadViewIfNeeded()
    }
    
    func testLoadingView_AddViewIsSubview(){
        
        XCTAssertTrue(sut.addView.isDescendant(of: sut.view)) 
        
    }
    
    func testingLoadingView_IsNavigationBarTitleNewTask() {
        
        XCTAssertEqual(sut.navigationItem.title, "New Task")
        
    }
    
    func testLoadingView_IsDoneButtonNotNil() {
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testingLoadingView_IsRightBarButtonTitleDone() {
        
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.title, "Done")
        
    }
    
    func testingLoadingView_IsRightBarButtonSelectorSaveTask() {
        
        let buttonItem = sut.navigationItem.rightBarButtonItem
        
        XCTAssertNotNil(buttonItem?.action)
        XCTAssertNotNil(buttonItem?.target)
        XCTAssertEqual(buttonItem?.action, #selector(sut.createTask))
        
    }
    
    func testCreateTask_WithValidTitle_CreatesATask() {
        
        let title = "Foo"
        let dueDate = Date(timeIntervalSince1970: 1528536334)
        
        sut.addView.titleTextField.text = title
        sut.addView.dueDateDatePicker.date = dueDate
        sut.createTask()
        
        let viewModel = TaskCell.ViewModel(title: title, dueDate: "\(dueDate)")
        
        XCTAssertEqual(sut.task!, viewModel.task)
        
    }
    
    func testCreateTask_WithNoValidTitle_CreatesATask() {
        
        let title = ""
        let dueDate = Date(timeIntervalSince1970: 1528536334)
        
        sut.addView.titleTextField.text = title
        sut.addView.dueDateDatePicker.date = dueDate
        sut.createTask()
        
        XCTAssertNil(sut.task)
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
}
