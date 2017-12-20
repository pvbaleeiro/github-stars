//
//  RepositoriesControllerUITests.swift
//  GithubStarsUITests
//
//  Created by Victor Baleeiro on 19/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit
import XCTest


@available(iOS 9.0, *)
class RepositoriesControllerUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testClickOnRepositoryCell() {
        //Launch app
        app.launch()
        
        // Assert that we are displaying the tableview
        let repositoryTableView = app.tables["tbvRepositories-MainViewController"]
    }
    
}

