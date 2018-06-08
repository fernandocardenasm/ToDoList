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
    
    func testLoadingView_AddViewIsSubview(){
        let sut = AddViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.addView.isDescendant(of: sut.view)) 
        
    }
    
}
