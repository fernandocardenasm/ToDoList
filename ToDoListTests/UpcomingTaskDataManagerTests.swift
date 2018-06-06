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
    
    var sut: UpcomingTaskDataManager!
    
    override func setUp() {
        super.setUp()
        
        sut = UpcomingTaskDataManager()
        
    }
    
    func testAdd_WithSection_IncreasesNumberOfSectionsByOne(){
        
        let numberOfSections = sut.numberOfSections()
        
        sut.add(section: Section<Task>(title: "Hola", items: []))
        
        XCTAssertEqual(numberOfSections + 1, sut.numberOfSections())
        
    }
    
    func testRemove_WithIndexZero_DecreasesNumberOfSectionsByOne(){
        let numberOfSections = sut.numberOfSections()
        
        sut.remove(at: 0)
        
        XCTAssertEqual(numberOfSections - 1, sut.numberOfSections())
        
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
}
