//
//  JSONParserTests.swift
//  Stations
//
//  Created by OldMan on 20/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import XCTest
import Foundation
@testable import Stations

class JSONParserTests: XCTestCase {
    
    var parser: JSONParser!
    
    override func setUp() {
        super.setUp()
        parser = JSONParser()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParsePoint() {
//        let rightPoint = Point(longtitude: 16.36879539489746, latitude: 48.20253753662109)
        
        
//        XCTAssertNil(Point(longtitude: nil, latitude: 48.20253753662109))
        
        
        let point = [
            "longitude" : 16.36879539489746,
            "latitude" : 48.20253753662109
        ]
        
        let result = parser.parsePoint(point)
//        print(result.latitude)
        
//        print(NSNumber(double: 48.20253753662109))
//        print((result!.latitude))

        
        XCTAssertEqual(result!.latitude, NSNumber(double: 48.20253753662109))
        XCTAssertEqual((result?.longtitude)!, NSNumber(double: 16.36879539489746))
    }

    func testParseStation() {
        
        let jsonStation = [
            "countryTitle" : "Австрия",
            "point" : [
                "longitude" : 16.36879539489746,
                "latitude" : 48.20253753662109
            ],
            "districtTitle" : "",
            "cityId" : 2352,
            "cityTitle" : "город Вена",
            "regionTitle" : "",
            "stationId" : 10154,
            "stationTitle" : "International Busterminal, Edbergstarsse 200 A"
        ]
        
//        let result =
        
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
