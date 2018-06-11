//
//  APIClientTests.swift
//  ToDoListTests
//
//  Created by Fernando on 11.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import XCTest

@testable import ToDoList

class APIClientTests:XCTestCase {
    
    var sut: APIClient!
    var mockURLSession: MockURLSession!
    var postLogIn: PostLogIn!
    var userLoggingIn: UserLoggingIn!
    
    override func setUp() {
        super.setUp()
        sut = APIClient()
        mockURLSession = MockURLSession()
        sut.session = mockURLSession
        
        postLogIn = PostLogIn()
        userLoggingIn = UserLoggingIn(email: "a@a.com", password: "123456", returnSecureToken: true)
        
    }
    
    func testLogIn_UsesExptectedHost() {
        
        
        sut.loginUser(request: postLogIn, user: userLoggingIn) { (response) in
        }
        
        XCTAssertEqual(mockURLSession.urlComponents?.host, "authentication.com")
        
    }
    
    func testLogIn_UsesExptectedPath() {
        
        sut.loginUser(request: postLogIn, user: userLoggingIn) { (response) in
        }
        
        XCTAssertEqual(mockURLSession.urlComponents?.path, "/verifyPassword")
    }
    
    func testLogin_UsesExptectedQuery() {
        
        sut.loginUser(request: postLogIn, user: userLoggingIn) { (response) in
        }
        
        XCTAssertEqual(mockURLSession.urlComponents?.query, "key=APIKey")
    }
    
    func testLogIn_WhenSuccessful_ReturnsUserLoggedIn() {
        
        let encoder = JSONEncoder()
        do {
            
            //We encode the data that we expect to receive in the response that is a UserLoggedIn
            
            let userLoggedIn = UserLoggedIn(email: "a@a.com", localId: "1234567890", idToken: "MyIdToken")
            
            let jsonData = try encoder.encode(userLoggedIn)
            
            mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
            sut.session = mockURLSession
            
            let dataExpectation = expectation(description: "Data")
            
            //The response for this request is UserLoggedIn
            var caughtData: UserLoggedIn? = nil
            
            sut.loginUser(request: postLogIn, user: userLoggingIn) { (response) in
                
                switch response {
                case .success(let value):
                    print(value)
                    caughtData = value
                    dataExpectation.fulfill()
                    
                case .failure(let error):
                    print(error)
                    print("Error")
                    
                }
            }
            
            waitForExpectations(timeout: 1) { _ in
                if let caughtData = caughtData {
                    XCTAssertEqual(caughtData, userLoggedIn)
                }
                else {
                    XCTFail()
                }
            }
            
        } catch {
            print("It could not decode it")
            XCTFail()
        }
    }
    
    override func tearDown() {
        mockURLSession = nil
        sut = nil
        postLogIn = nil
        userLoggingIn = nil
        
        super.tearDown()
    }
    
}
extension APIClientTests {
    class MockURLSession: SessionProtocol {
        var url: URL?
        
        private let dataTask: MockTask
        
        init(data: Data? = nil, urlResponse: URLResponse? = nil, error: Error? = nil) {
            dataTask = MockTask(data: data, urlResponse: urlResponse, error: error)
        }
        
        func dataTask(
            with url: URL,
            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
            -> URLSessionDataTask {
            
                self.url = url
                
                print(url)
                dataTask.completionHandler = completionHandler
                return dataTask
                //The initial return before
//                return URLSession.shared.dataTask(with: url)
                
            }
        
        var urlComponents: URLComponents? {
            guard let url = url else { return nil }
            return URLComponents(url: url,
                                 resolvingAgainstBaseURL: true)
        }
    }
    
    class MockTask: URLSessionDataTask {
        private let data: Data?
        private let urlResponse: URLResponse?
        private let responseError: Error?
        
        typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
        var completionHandler: CompletionHandler?
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            self.data = data
            self.urlResponse = urlResponse
            self.responseError = error
        }
        
        override func resume() {
            DispatchQueue.main.async {
                self.completionHandler?(self.data, self.urlResponse, self.responseError)
            }
        }
        
    }

}
