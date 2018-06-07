//
//  UpcomingTaskDataManagerTableViewAdapterTests.swift
//  ToDoListTests
//
//  Created by Fernando on 06.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class TaskTableViewAdapterTests: XCTestCase {
    
    var section: Section<Task>!
    var task: Task!
    
    var sut: TaskTableViewAdapter!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        //Variables
        task = Task(title: "First Task", dueDate: 123456)
        section = Section<Task>(title: "First Title", items: [task])
        
        sut = TaskTableViewAdapter(taskDataManager: TaskDataManager())
        tableView = UITableView()
        tableView?.dataSource = sut
        tableView.delegate = sut
        sut.taskDataManager.removeAllSections()
        sut.taskDataManager.add(section: section)
        
        //Not sure why it is not always necessary to add this even if I added a new section. It adds some extra milliseconds in the test if it is uncommented.
//        tableView.reloadData()

    }
    
    //Datasource
    func testNumberOfSections_IsNumberOfSections(){
        
        let numberOfSections = sut.taskDataManager.numberOfSections()
        XCTAssertEqual(tableView.numberOfSections, numberOfSections)
        
    }
    
    func testNumberOfRows_InSectionZeroAndTaskAdded_IsNumberOfTasksInSection(){
        
        var numberOfTasksInSectionZero = sut.taskDataManager.numberOfTasks(inSection: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
        sut.taskDataManager.add(task: task, inSection: 0)
        numberOfTasksInSectionZero = sut.taskDataManager.numberOfTasks(inSection: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
    }
    
    func testNumberOfRows_InSectionZeroAndTaskZeroRemoved_IsNumberOfTasksInSection(){
        
        var numberOfTasksInSectionZero = sut.taskDataManager.numberOfTasks(inSection: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
        sut.taskDataManager.removeTask(at: 0, inSection: 0)
        numberOfTasksInSectionZero = sut.taskDataManager.numberOfTasks(inSection: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), numberOfTasksInSectionZero)
        
    }
    
    func testCellForRow_AtZero_ReturnsTaskCell() {
        
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        //The reloadData is necessary so the cellForRow at Indexpath does not return nil
        mockTableView.reloadData()

        //The ideal way returns nil for an unknown reason
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(cell is TaskCell)
        
    }
    
    func testCellForRow_DequeuesCellFromTableView() {
        
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        
        //The reloadData is necessary so the cellForRow at Indexpath does not return nil
        mockTableView.reloadData()
        
        //The ideal way returns nil for an unknown reason
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
        
    }
    
    func testCellForRow_CallsConfigCell() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        
        sut.taskDataManager.add(section: section)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTableViewCell
        
        guard let catchedTask = cell.catchedTask else { return }
        
        XCTAssertEqual(catchedTask, task)
        
    }
    
    func test_TitleForHeaderInSection_WithSectionZero_IsTitleOfSection() {
        
        let titleSection = sut.taskDataManager.titleOfSection(at: 0)
        
        let cellTitle = sut.tableView(tableView, titleForHeaderInSection: 0)
        
        XCTAssertEqual(titleSection, cellTitle)
        
    }
    
    //Delegate
    
    func testDeleteButton_InSectionZero_ShowsTitleCheck(){

        let deleteButtonTitle = sut.tableView(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(deleteButtonTitle, "Delete")
        
    }
    
    func testDeletingAnItem_DeletesItInTheUpdatingTaskDataManager() {
        
        sut.tableView(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.taskDataManager.numberOfTasks(inSection: 0), 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
        
    }
    
    override func tearDown() {
        
        sut = nil
        tableView = nil
        
        super.tearDown()
    }
    
}

extension TaskTableViewAdapterTests {
    class MockTableView: UITableView {
        
        class func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView{
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockTableViewCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
            
            return mockTableView
        }
        
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            
        }
    }
    
    class MockTableViewCell: TaskCell {
        
        var catchedTask: Task?
        
        override func configCell(with task: Task) {
            catchedTask = task
        }
        
    }
}
