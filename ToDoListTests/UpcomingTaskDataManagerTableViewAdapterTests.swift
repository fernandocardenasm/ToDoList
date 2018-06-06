//
//  UpcomingTaskDataManagerTableViewAdapterTests.swift
//  ToDoListTests
//
//  Created by Fernando on 06.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList


class UpcomingTaskDataManagerTableViewAdapterTests: XCTestCase {
    
    
    var sut: UpcomingTaskDataManagerTableViewAdapter!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        sut = UpcomingTaskDataManagerTableViewAdapter(upcomingTaskDataManager: UpcomingTaskDataManager())
        tableView = UITableView()
        tableView?.dataSource = sut
        
    }
    
    func testNumberOfSections_IsNumberOfSections(){
        
        let numberOfSections = sut.upcomingTaskDataManager.numberOfSections()
        XCTAssertEqual(tableView.numberOfSections, numberOfSections)
        
    }
    
    func testNumberOfRows_InSectionZero_IsNumberOfTasksInSection(){
        
        
        var numberOfTasksInSectionZero = sut.upcomingTaskDataManager.numberOfTasks(inSection: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
        sut.upcomingTaskDataManager.add(task: Task(title: "Lo mejor", dueDate: 123456), inSection: 0)
        
        numberOfTasksInSectionZero = sut.upcomingTaskDataManager.numberOfTasks(inSection: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
    }
    
//    func test_TitleForHeaderInSection_WithSectionZero_IsTitleOfSection() {
//
//        let title = sut.upcomingTaskDataManager.titleOfSection(at: 0)
//
//    }
    
    override func tearDown() {
        
        sut = nil
        tableView = nil
        
        super.tearDown()
    }
    
}
