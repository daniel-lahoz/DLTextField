//
//  DLTextFieldTests.swift
//  DLTextField
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import XCTest
@testable import DLTextField

class DLTextFieldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDLDouble() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var a: DLDouble = DLDouble(11.0)
        var b: DLDouble = DLDouble(22.0)
        
        XCTAssertEqual(a.val, a.originalVal, "Not same value")
        XCTAssertEqual(b.val, b.originalVal, "Not same value")
        
        a.val = 33.3
        b.val = 66.6
        
        XCTAssertNotEqual(a.val, a.originalVal, "Is equal")
        XCTAssertNotEqual(b.val, b.originalVal, "Is equal")
        
        XCTAssertEqual(a.val, 33.3, "Not good value")
        XCTAssertEqual(b.val, 66.6, "Not good value")
        
        let c = a.val + b.val
        
         XCTAssertEqual(c, 99.9, "Not good value")
        
    }
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    */
}
