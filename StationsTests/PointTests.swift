//
//  PointTests.swift
//  Stations
//
//  Created by OldMan on 20/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import XCTest
@testable import Stations

class PointTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitializer() {
        
        XCTAssertNil(Point(longtitude: nil, latitude: 48.20253753662109))
        XCTAssertNil(Point(longtitude: 48.20253753662109, latitude: nil))
        XCTAssertNil(Point(longtitude: nil, latitude: nil))
        XCTAssertNotNil(Point(longtitude: 48.20253753662109, latitude: 48.20253753662109))
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
