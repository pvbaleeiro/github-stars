//
//  FontsetTests.swift
//  GithubStarsTests
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import XCTest
@testable import GithubStars


class FontsetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFontSanFranciscoUltraLight() {
        
        //Case test
        let value:CGFloat = 20
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .ultraLight)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoUltraLight(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoUltraLight, got other")
    }
    
    func testFontSanFranciscoUltraThin() {
        
        //Case test
        let value:CGFloat = 33
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .thin)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoThin(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoThin, got other")
    }
    
    func testFontSanFranciscoLight() {
        
        //Case test
        let value:CGFloat = 1
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .light)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoLight(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoLight, got other")
    }
    
    func testFontSanFranciscoRegular() {
        
        //Case test
        let value:CGFloat = 100
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .regular)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoRegular(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoRegular, got other")
    }
    
    func testFontSanFranciscoMedium() {
        
        //Case test
        let value:CGFloat = 4
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .medium)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoMedium(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoMedium, got other")
    }

    func testFontSanFranciscoSemiBold() {
        
        //Case test
        let value:CGFloat = 15
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .semibold)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoSemiBold(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoSemiBold, got other")
    }
    
    func testFontSanFranciscoBold() {
        
        //Case test
        let value:CGFloat = 26
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .bold)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoBold(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoBold, got other")
    }
    
    func testFontSanFranciscoHeavy() {
        
        //Case test
        let value:CGFloat = 29
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .heavy)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoHeavy(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoHeavy, got other")
    }
    
    func testFontSanFranciscoBlack() {
        
        //Case test
        let value:CGFloat = 57
        let expected: UIFont
        if #available(iOS 8.2, *) {
            expected = UIFont.systemFont(ofSize: value, weight: .black)
        } else {
            expected = UIFont.systemFont(ofSize: value)
        }
        
        //Result
        let result = UIFont.sanFranciscoBlack(size: value)
        
        //Error or success
        XCTAssert(result == expected, "Expected font sanFranciscoBlack, got other")
    }
}

