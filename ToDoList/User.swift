//
//  User.swift
//  ToDoList
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

//The server responsed with this struct if the sign in was successful
struct UserLoggedIn: Codable, Equatable {
    
    let email: String
    let localId: String
    let idToken: String
    
}

//Structure require to sign in up in Firebase
struct UserLoggingIn: Encodable {
    
    let email: String
    let password: String
    
    let returnSecureToken: Bool
    
}


