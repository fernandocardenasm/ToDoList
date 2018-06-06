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
        XCTAssertNotNil(sut.upcomingTaskDataManager)
    }
    
    func testLoadingView_SetsTableViewDataSource(){
        
        XCTAssertTrue(sut.tableView.dataSource is UpcomingTaskDataManagerTableViewAdapter)
    }
    
    func testLoadingView_SetsTableViewDelegate(){
        XCTAssertTrue(sut.tableView.delegate is UpcomingTaskDataManagerTableViewAdapter)
    }
    
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
}
