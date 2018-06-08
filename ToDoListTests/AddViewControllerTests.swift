//
//  AddViewControllerTests.swift
//  ToDoListTests
//
//  Created by Fernando on 08.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class AddViewControllerTests: XCTestCase {
    
    var sut: AddViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = AddViewController()
        sut.loadViewIfNeeded()
    }
    
    func testLoadingView_AddViewIsSubview(){
        
        XCTAssertTrue(sut.addView.isDescendant(of: sut.view)) 
        
    }
    
    func testingLoadingView_IsNavigationBarTitleNewTask() {
        
        XCTAssertEqual(sut.navigationItem.title, "New Task")
        
    }
    
    func testLoadingView_IsDoneButtonNotNil() {
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testingLoadingView_IsRightBarButtonTitleDone() {
        
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.title, "Done")
        
    }
    
    func testingLoadingView_IsRightBarButtonSelectorSaveTask() {
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem?.action)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.action, #selector(sut.saveTask))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
}
