//
//  City.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import Foundation

class City: Place {
    var stations = [Station]() { willSet(newValue) {
        //stations sorting
            self.stations = newValue.sort({$0.stationTitle < $1.stationTitle})
        }
    }
    
    init(countryTitle: String?,
         point: Point?,
         districtTitle: String?,
         cityID: Int?,
         cityTitle: String?,
         regionTitle: String?,
         stations: [Station]) {
        
        super.init(countryTitle: countryTitle,
             point: point,
             districtTitle: districtTitle,
             cityID: cityID,
             cityTitle: cityTitle,
             regionTitle: regionTitle)
        
        self.stations = stations
        
        
    }
}