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
    
    func testSaveTask_WithTask_IncreasesTasksInSectionByOne() {
        
        let dueDate = Date().plus(numberOfDays: 2)
        let task = Task(title: "Foo", dueDateTimestamp: dueDate.timeIntervalSince1970)
        
        let sectionIndex = TaskSection.init(forTaskDueDate: dueDate).rawValue
        
        let numberOfTasksInSection = sut.taskDataManager?.numberOfTasks(inSection: sectionIndex)
        
        sut.saveTask(task: task)
        
        let numberOfTaskInSectionAfter = sut.taskDataManager?.numberOfTasks(inSection: sectionIndex)
        
        XCTAssertEqual(numberOfTasksInSection! + 1, numberOfTaskInSectionAfter)

    }
    
    func testSaveTask_WithTask_SameTask() {
        
        let dueDate = Date().plus(numberOfDays: 2)
        let task = Task(title: "Foo", dueDateTimestamp: dueDate.timeIntervalSince1970)
            
        sut.taskDataManager?.removeTasksInAllSections()
        let sectionIndex = TaskSection.init(forTaskDueDate: dueDate).rawValue
        
        sut.saveTask(task: task)
        
        XCTAssertEqual(sut.taskDataManager?.task(at: 0, inSection: sectionIndex), task)
        
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
}
