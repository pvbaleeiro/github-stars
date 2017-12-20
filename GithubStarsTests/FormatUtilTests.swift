//
//  FormatUtilTests.swift
//  GithubStarsTests
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import XCTest
@testable import GithubStars


class FormatUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFriendlyPointSmallerThanThousand() {
        
        //Case test
        let value:Int = 999
        let expected: String = "999"
        
        //Result
        let result = FormatUtil.friendlyFormatValuePoint(from: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected " + expected + " got \(result)")
    }
    
    func testFriendlyPointGreaterThanThousand() {
        
        //Case test
        let value:Int = 1500
        let expected: String = "1.5K"
        
        //Result
        let result = FormatUtil.friendlyFormatValuePoint(from: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected " + expected + " got \(result)")
    }
    
    func testFriendlyPointSmallerThanMillion() {
        
        //Case test
        let value:Int = 999100
        let expected: String = "999.1K"
        
        //Result
        let result = FormatUtil.friendlyFormatValuePoint(from: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected " + expected + " got \(result)")
    }
    
    func testFriendlyPointGreaterThanMillion() {
        
        //Case test
        let value:Int = 1500500
        let expected: String = "1.5M"
        
        //Result
        let result = FormatUtil.friendlyFormatValuePoint(from: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected " + expected + " got \(result)")
    }
}
