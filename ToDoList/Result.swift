//
//  Result.swift
//  ToDoList
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void
