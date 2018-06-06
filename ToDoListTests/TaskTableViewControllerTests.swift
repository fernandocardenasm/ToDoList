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
    
    var controller: TaskTableViewController!
        
    override func setUp() {
        super.setUp()
        controller = TaskTableViewController(style: .plain)
        controller.loadViewIfNeeded()
        
    }
    
    func testLoadingViewUpcomingTaskDataManagerIsNotNil() {
        XCTAssertNotNil(controller.upcomingTaskDataManager)
    }
    
    func testLoadingView_SetsTableViewDataSource(){
        
        XCTAssertTrue(controller.tableView.dataSource is UpcomingTaskDataManagerTableViewAdapter)
    }
    
    func testLoadingView_SetsTableViewDelegate(){
        XCTAssertTrue(controller.tableView.delegate is UpcomingTaskDataManagerTableViewAdapter)
    }
    
    
    override func tearDown() {
        
        controller = nil
        
        super.tearDown()
    }
}
