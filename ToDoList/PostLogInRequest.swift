//
//  PostLogInRequest.swift
//  ToDoList
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class PostLogIn: APIRequest {
    
    typealias Response = UserLoggedIn
    
    var resourceName = "/verifyPassword"
    
}
