//
//  APIGithubTests.swift
//  GithubStarsTests
//
//  Created by Victor Baleeiro on 18/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import XCTest
@testable import GithubStars


class APIGithubTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadGithubRepositoriesSucess() {
        
        //Case test
        let valuePage: Int = 5
        let ex = expectation(description: "Expecting a list of repostitory not nil")
        
        ApiGithub.getRepositoriesJavaByStars(page: valuePage) {
            (response) in
            
            switch response {
            case .onSuccess(let repos as RepositoryList):
                print(repos)
                XCTAssertNotNil(repos)
                ex.fulfill()
                break
                
            case .onFailure(let erro):
                print(erro)
                XCTAssertNil(erro)
                ex.fulfill()
                break
                
            case .onNoConnection():
                print("Sem conexão")
                XCTAssertNil("")
                ex.fulfill()
                break
                
            default:
                break
            }
        }
        
        //Waiting...
        waitForExpectations(timeout: 30) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    //Limitation from Github API: Only the first 1000 search results are available
    func testLoadGithubRepositoriesFail() {
        
        //Case test
        let valuePage: Int = 200
        let ex = expectation(description: "Expecting a error")
        
        ApiGithub.getRepositoriesJavaByStars(page: valuePage) {
            (response) in
            
            switch response {
            case .onSuccess(let repos as RepositoryList):
                print(repos)
                XCTAssert(false, "A error was expecting...")
                ex.fulfill()
                break
                
            case .onFailure(let erro):
                print(erro)
                XCTAssert(true)
                ex.fulfill()
                break
                
            case .onNoConnection():
                print("Sem conexão")
                XCTAssert(false)
                ex.fulfill()
                break
                
            default:
                break
            }
        }
        
        //Waiting...
        waitForExpectations(timeout: 30) { (error) in
            if let error = error {
                XCTAssert(true, "As expected, error: \(error)")
            }
        }
    }
}


