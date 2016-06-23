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
        
        
        self.countryTitle = countryTitle == nil || countryTitle!.isEmpty ? nil : countryTitle
        self.point = point
        self.districtTitle = districtTitle == nil || districtTitle!.isEmpty ? nil : districtTitle
        self.cityID = cityID
        self.cityTitle = cityTitle == nil || cityTitle!.isEmpty ? nil : cityTitle
        self.regionTitle = regionTitle == nil || regionTitle!.isEmpty ? nil : regionTitle
    }
}