//
//  TaskTableViewControllerTests.swift
//  ToDoListTests
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class TaskTableViewControllerTests: XCTestCase {
    
    var sut: TaskTableViewController!
        
    override func setUp() {
        super.setUp()
        sut = TaskTableViewController(style: .plain)
        sut.loadViewIfNeeded()
        
    }
    
    func testLoadingViewTaskDataManagerIsNotNil() {
        XCTAssertNotNil(sut.taskDataManager)
    }
    
    func testLoadingView_SetsTableViewDataSource(){
        
        XCTAssertTrue(sut.tableView.dataSource is TaskTableViewAdapter)
    }
    
    func testLoadingView_SetsTableViewDelegate(){
        XCTAssertTrue(sut.tableView.delegate is TaskTableViewAdapter)
    }
    
    func testLoadingView_IsAddButtonNotNil() {
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testingLoadingView_IsRightBarButtonSelectorSaveTask() {
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem?.action)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.action, #selector(sut.presentAddViewController))
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
}
