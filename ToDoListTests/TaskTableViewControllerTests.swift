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
    
    func testLoadingViewUpcomingTaskDataManagerIsNotNil() {
        XCTAssertNotNil(sut.taskDataManager)
    }
    
    func testLoadingView_SetsTableViewDataSource(){
        
        XCTAssertTrue(sut.tableView.dataSource is TaskTableViewAdapter)
    }
    
    func testLoadingView_SetsTableViewDelegate(){
        XCTAssertTrue(sut.tableView.delegate is TaskTableViewAdapter)
    }
    
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
}
