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
    
    func testNumberOfRows_InSectionZeroAndTaskAdded_IsNumberOfTasksInSection(){
        
        
        var numberOfTasksInSectionZero = sut.upcomingTaskDataManager.numberOfTasks(inSection: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
        sut.upcomingTaskDataManager.add(task: Task(title: "Lo mejor", dueDate: 123456), inSection: 0)
        
        numberOfTasksInSectionZero = sut.upcomingTaskDataManager.numberOfTasks(inSection: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
    }
    
    func testNumberOfRows_InSectionZeroAndTaskZeroRemoved_IsNumberOfTasksInSection(){
        
        
        var numberOfTasksInSectionZero = sut.upcomingTaskDataManager.numberOfTasks(inSection: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
        sut.upcomingTaskDataManager.removeTask(at: 0, inSection: 0)
        
        numberOfTasksInSectionZero = sut.upcomingTaskDataManager.numberOfTasks(inSection: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
    }
    
    func testCellForRow_AtZero_ReturnsTaskCell() {
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        let indexPath = IndexPath(row: 0, section: 0)
    
        //This is line could be refactor
        let cell = sut.tableView(tableView, cellForRowAt: indexPath)

        //The ideal way returns nil for an unknown reason
//        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is TaskCell)
        
    }
    
    func testCellForRow_DequeuesCellFromTableView() {
        
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        sut.upcomingTaskDataManager.add(section: Section(title: "Hola", items: [Task(title: "K", dueDate: 123456)]))
        mockTableView.reloadData()
        
        //This is line could be refactor
        _ = sut.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        //The ideal way returns nil for an unknown reason
//        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
        
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

extension UpcomingTaskDataManagerTableViewAdapterTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            
        }
        
    }
}
