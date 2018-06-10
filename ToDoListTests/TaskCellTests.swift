//
//  TaskCellTests.swift
//  ToDoListTests
//
//  Created by Fernando on 07.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class TaskCellTests: XCTestCase {
    
    var tableView: UITableView!
    var dataSource: FakeDataSource!
    
    var cell: TaskCell!
    
    override func setUp() {
        super.setUp()
        
        tableView = UITableView()
        tableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        dataSource = FakeDataSource()
        tableView.dataSource = dataSource
        
        cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as! TaskCell
        
    }
    
    func testHasTitleLabel() {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as! TaskCell
        
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
        
    }
    
    func testHasDueDateLabel() {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as! TaskCell
        
        XCTAssertTrue(cell.dueDateLabel.isDescendant(of: cell.contentView))
        
    }
    
    func testViewModel_SetsTitleLabel() {
        
        let task = Task(title: "First Task", dueDateTimestamp: 1528329600)
        let viewModel = TaskCell.ViewModel(task: task)
        
        cell.viewModel = viewModel

        XCTAssertEqual(cell.titleLabel.text, viewModel.title)
    }
    
    func testViewModel_SetsDueDateLabel() {
        
        let task = Task(title: "First Task", dueDateTimestamp: 1528329600)
        let viewModel = TaskCell.ViewModel(task: task)
        
        cell.viewModel = viewModel
        
        XCTAssertEqual(cell.dueDateLabel.text, viewModel.dueDate)
        
    }
    
    func testViewModel_WithTwoDaysFromNow_ReturnsTwoDaysAgo() {
        
        let dueDate = Date().plus(numberOfDays: 2)
        let task = Task(title: "Foo", dueDateTimestamp: dueDate.timeIntervalSince1970)
        
        let viewModel = TaskCell.ViewModel(task: task)
        
        XCTAssertEqual(viewModel.dueDate, "2 days")
        
    }
    
    func testViewModel_WithOneDayFromNow_ReturnsOneDayAgo() {
        
        let dueDate = Date().plus(numberOfDays: 1)
        let task = Task(title: "Foo", dueDateTimestamp: dueDate.timeIntervalSince1970)
        
        let viewModel = TaskCell.ViewModel(task: task)
        
        XCTAssertEqual(viewModel.dueDate, "1 day")
        
    }
    
    override func tearDown() {
        
        dataSource = nil
        tableView = nil
        
        cell = nil
        
        super.tearDown()
    }
    
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
    }
}
