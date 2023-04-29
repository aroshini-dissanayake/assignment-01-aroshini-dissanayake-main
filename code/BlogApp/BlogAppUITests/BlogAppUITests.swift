//
//  BlogAppUITests.swift
//  BlogAppUITests
//
//  Created by Sajani Jayasinghe on 2023-04-29.
//

import XCTest

final class BlogAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Activities"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["minutes"]/*[[".cells.staticTexts[\"minutes\"]",".staticTexts[\"minutes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Edit Activity"]/*[[".buttons[\"Edit Activity\"].staticTexts[\"Edit Activity\"]",".staticTexts[\"Edit Activity\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.buttons["UPDATE"].tap()
        app.navigationBars["BlogApp.SpecificVC"].buttons["Back"].tap()
        
        tabBar.buttons["Home"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
