//
//  AppInfoVCTests.swift
//  Stations
//
//  Created by OldMan on 20/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import XCTest
@testable import Stations

class AppInfoVCTests: XCTestCase {
    
    var controller: AppInfoViewController!
    
    override func setUp() {
        super.setUp()
        
        controller = AppInfoViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetVersion() {
        let label = UILabel()
        
        controller.updateVersionInfo(label)
        print(label.text)
        XCTAssertNotNil(label.text)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
