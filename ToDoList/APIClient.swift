//
//  APIClientAuthentication.swift
//  ToDoList
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class APIClient {
    lazy var session: SessionProtocol = URLSession.shared
    
    let baseEndpoint = "https://authentication.com"
    let key = "APIKey"
    
    
    func loginUser<T: APIRequest>(request: T, user: Encodable, completion: @escaping ResultCallback<T.Response>){
        
        
        guard let url = endpoint(for: request) else { fatalError() }
        
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    let fireBaseResponse = try decoder.decode(T.Response.self, from: data)
                    
                    completion(.success(fireBaseResponse))
                }
                catch {
                    completion(.failure(error))
                }
            }
            else if let error = error {
                completion(.failure(error))
            }
            else {
                completion(.failure(WebserviceError.DataEmptyError))
            }
            
        }.resume()
    }
    
    func endpoint<T: APIRequest>(for request: T) -> URL? {
        return URL(string: "\(baseEndpoint)\(request.resourceName)?key=\(key)")
    }
    
}

protocol SessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    ->URLSessionDataTask
}

protocol APIRequest {
    
    associatedtype Response: Codable
    
    var resourceName:String { get }
}

extension URLSession: SessionProtocol {
    
}
