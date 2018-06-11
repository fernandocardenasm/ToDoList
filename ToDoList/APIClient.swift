//
//  APIClient.swift
//  ToDoList
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class APIClientAuthentication {
    lazy var session: SessionProtocol = URLSession.shared
    
    
}

protocol SessionProtocol {
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
    
}
    
extension URLSession: SessionProtocol {
    
}
