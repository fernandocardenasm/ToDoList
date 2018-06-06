//
//  UpcomingTaskDataManagerTests.swift
//  ToDoListTests
//
//  Created by Fernando on 06.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class UpcomingTaskDataManagerTests: XCTestCase {
    
    var upcomingTaskDataManager: UpcomingTaskDataManager!
    
    override func setUp() {
        super.setUp()
        
        upcomingTaskDataManager = UpcomingTaskDataManager()
        
    }
    
    func testAdd_WithSection_IncreasesNumberOfSectionsByOne(){
        
        let numberOfSections = upcomingTaskDataManager?.numberOfSections()
        
        upcomingTaskDataManager?.add(section: Section<Task>(title: "Hola", items: []))
        
        XCTAssertEqual(numberOfSections! + 1, upcomingTaskDataManager?.numberOfSections())
        
    }
    
    func testRemove_WithIndexZero_DecreasesNumberOfSectionsByOne(){
        let numberOfSections = upcomingTaskDataManager?.numberOfSections()
        
        upcomingTaskDataManager?.remove(at: 0)
        
        XCTAssertEqual(numberOfSections! - 1, upcomingTaskDataManager?.numberOfSections())
        
    }
    
    override func tearDown() {
        
        upcomingTaskDataManager = nil
        
        super.tearDown()
    }
    
}
