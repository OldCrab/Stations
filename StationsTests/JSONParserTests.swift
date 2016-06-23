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
        

        let point = [
            "longitude" : 16.36879539489746,
            "latitude" : 48.20253753662109
        ]
        
        let result = parser.parsePoint(point)

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
        
        let result = parser.parseStation(jsonStation)
        
        XCTAssertEqual(result.countryTitle, "Австрия")
        XCTAssertNotNil(result.point)
        XCTAssertNil(result.regionTitle)
        XCTAssertEqual(result.cityTitle, "город Вена")
        XCTAssertEqual(result.cityID, 2352)
        XCTAssertNil(result.districtTitle)
        XCTAssertEqual(result.stationId, 10154)
        XCTAssertEqual(result.stationTitle, "International Busterminal, Edbergstarsse 200 A")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testParseStations() {
        let stations = [
            [
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
            ],
            [
                "countryTitle" : "Австрия",
                "point" : [
                    "longitude" : 16.36879539489746,
                    "latitude" : 48.20253753662109
                ],
                "districtTitle" : "",
                "cityId" : 2352,
                "cityTitle" : "город Вена",
                "regionTitle" : "",
                "stationId" : 9864,
                "stationTitle" : "Stadion Center, Engerthstr. 242"
            ],
            [
                "countryTitle" : "Австрия",
                "point" : [
                    "longitude" : 16.36879539489746,
                    "latitude" : 48.20253753662109
                ],
                "districtTitle" : "",
                "cityId" : 2352,
                "cityTitle" : "город Вена",
                "regionTitle" : "",
                "stationId" : 9778,
                "stationTitle" : "Stadion Center, Olympiaplatz 2"
            ],
            [
                "countryTitle" : "Австрия",
                "point" : [
                    "longitude" : 16.36879539489746,
                    "latitude" : 48.20253753662109
                ],
                "districtTitle" : "",
                "cityId" : 2352,
                "cityTitle" : "город Вена",
                "regionTitle" : "",
                "stationId" : 434,
                "stationTitle" : "U-BHF ERDBERGSTR."
            ],
            [
                "countryTitle" : "Австрия",
                "point" : [
                    "longitude" : 16.36879539489746,
                    "latitude" : 48.20253753662109
                ],
                "districtTitle" : "",
                "cityId" : 2352,
                "cityTitle" : "город Вена",
                "regionTitle" : "",
                "stationId" : 874,
                "stationTitle" : "Vienna"
            ]
        ]

        let result = parser.parseStations(stations)
        
        XCTAssertEqual(result.count, 5)
    }
    
    func testParseCity() {
        var city = [
            "countryTitle" : "Австрия",
            "point" : [
                "longitude" : 16.36879539489746,
                "latitude" : 48.20253753662109
            ],
            "districtTitle" : "",
            "cityId" : 2352,
            "cityTitle" : "Вена",
            "regionTitle" : "",
            "stations" : [
                [
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
                ],
                [
                    "countryTitle" : "Австрия",
                    "point" : [
                        "longitude" : 16.36879539489746,
                        "latitude" : 48.20253753662109
                    ],
                    "districtTitle" : "",
                    "cityId" : 2352,
                    "cityTitle" : "город Вена",
                    "regionTitle" : "",
                    "stationId" : 9864,
                    "stationTitle" : "Stadion Center, Engerthstr. 242"
                ],
                [
                    "countryTitle" : "Австрия",
                    "point" : [
                        "longitude" : 16.36879539489746,
                        "latitude" : 48.20253753662109
                    ],
                    "districtTitle" : "",
                    "cityId" : 2352,
                    "cityTitle" : "город Вена",
                    "regionTitle" : "",
                    "stationId" : 9778,
                    "stationTitle" : "Stadion Center, Olympiaplatz 2"
                ],
                [
                    "countryTitle" : "Австрия",
                    "point" : [
                        "longitude" : 16.36879539489746,
                        "latitude" : 48.20253753662109
                    ],
                    "districtTitle" : "",
                    "cityId" : 2352,
                    "cityTitle" : "город Вена",
                    "regionTitle" : "",
                    "stationId" : 434,
                    "stationTitle" : "U-BHF ERDBERGSTR."
                ],
                [
                    "countryTitle" : "Австрия",
                    "point" : [
                        "longitude" : 16.36879539489746,
                        "latitude" : 48.20253753662109
                    ],
                    "districtTitle" : "",
                    "cityId" : 2352,
                    "cityTitle" : "город Вена",
                    "regionTitle" : "",
                    "stationId" : 874,
                    "stationTitle" : "Vienna"
                ]
            ]
        ]
        var result = parser.parseCity(city)
        
        XCTAssertEqual(result.countryTitle, "Австрия")
        XCTAssertNotNil(result.point)
        XCTAssertNil(result.regionTitle)
        XCTAssertEqual(result.cityTitle, "Вена")
        XCTAssertEqual(result.cityID, 2352)
        XCTAssertNil(result.districtTitle)
        XCTAssertEqual(result.stations.count, 5)
        
        city = [
            "countryTitle" : "Австрия",
            "point" : [
                "longitude" : 16.36879539489746,
                "latitude" : 48.20253753662109
            ],
            "districtTitle" : "",
            "cityId" : 2352,
            "cityTitle" : "Вена",
            "regionTitle" : "",
            "stations" : [
            ]
        ]
        result = parser.parseCity(city)
        XCTAssertEqual(result.stations.count, 0)
        
        city.removeValueForKey("stations")
        result = parser.parseCity(city)
    }
    
    func testParseAllCities() {
        if let path = NSBundle.mainBundle().pathForResource("allStations", ofType: "json") {
            if let jsonData = try? NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe) {
                let result = parser.parseAllCities(jsonData)

                XCTAssertNotNil(result["citiesTo"])
                XCTAssertNotNil(result["citiesFrom"])
                XCTAssertEqual(2681, result["citiesTo"]?.count)
                XCTAssertEqual(439, result["citiesFrom"]?.count)
            }
        }
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
