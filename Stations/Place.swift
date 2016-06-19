//
//  Place.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import Foundation

class Place {
    var countryTitle: String?
    var point: Point?
    var districtTitle: String?
    var cityID: Int?
    var cityTitle: String?
    var regionTitle: String?
    
    init(countryTitle: String?,
         point: Point?,
         districtTitle: String?,
         cityID: Int?,
         cityTitle: String?,
         regionTitle: String?) {
        
        self.countryTitle = countryTitle
        self.point = point
        self.districtTitle = districtTitle
        self.cityID = cityID
        self.cityTitle = cityTitle
        self.regionTitle = regionTitle
    }
}