//
//  Point.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import Foundation

class Point {
    var longtitude: NSNumber
    var latitude: NSNumber
    
    init?(longtitude: NSNumber?, latitude: NSNumber?) {
        guard let long = longtitude, let lati = latitude else {
            return nil
        }
        self.longtitude = long
        self.latitude = lati
    }
}