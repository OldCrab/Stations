//
//  Point.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import Foundation

class Point {
    var longtitude: Double
    var latitude: Double
    
    init?(longtitude: Double?, latitude: Double?) {
        guard let long = longtitude, let lati = latitude else {
            return nil
        }
        self.longtitude = long
        self.latitude = lati
    }
}