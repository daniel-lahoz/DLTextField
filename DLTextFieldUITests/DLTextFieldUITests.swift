//
//  DLTextFieldUITests.swift
//  DLTextFieldUITests
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import Foundation
import XCTest
@testable import DLTextField

class DLTextFieldUITest: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUITextFieldBoxes() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        app = XCUIApplication()
        app.launch()
        
        let text1TextField = app.textFields["Text1"]
        text1TextField.tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        key.tap()

        
        let doneButton = app.toolbars["Toolbar"].buttons["Done"]
        doneButton.tap()
        
        let labelElement = app.staticTexts["Label1"]
        var labelValue = labelElement.label
        XCTAssertEqual(labelValue, "222")
        
        let text2TextField = app.textFields["Text2"]
        text2TextField.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        key2.tap()

        doneButton.tap()
        
        let labelElement2 = app.staticTexts["Label2"]
        var labelValue2 = labelElement2.label
        XCTAssertEqual(labelValue2, "333")
        
        
        text1TextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".textFields[\"Text1\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        text2TextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".textFields[\"Text2\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        

        labelValue = labelElement.label
        XCTAssertEqual(labelValue, "11")
        
        labelValue2 = labelElement2.label
        XCTAssertEqual(labelValue2, "22")
        
        let labelElement3 = app.staticTexts["Label3"]
        let labelValue3 = labelElement3.label
        XCTAssertEqual(labelValue3, "33")
        
        let labelElement4 = app.staticTexts["Label4"]
        let labelValue4 = labelElement4.label
        XCTAssertEqual(labelValue4, "3,300.00%")
        
        let labelElement5 = app.staticTexts["Label5"]
        let labelValue5 = labelElement5.label
        XCTAssertEqual(labelValue5, "33")
        
        let labelElement6 = app.staticTexts["Label6"]
        let labelValue6 = labelElement6.label
        XCTAssertEqual(labelValue6, "$33.00")
        
    }
    
        
}

