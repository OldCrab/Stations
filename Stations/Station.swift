//
//  Station.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import Foundation

class Station: Place {
    var stationId: Int?
    var stationTitle: String?
    
    init(countryTitle: String?,
         point: Point?,
         districtTitle: String?,
         cityID: Int?,
         cityTitle: String?,
         regionTitle: String?,
         stationId: Int?,
         stationTitle: String?) {
        
        super.init(countryTitle: countryTitle,
                   point: point,
                   districtTitle: districtTitle,
                   cityID: cityID,
                   cityTitle: cityTitle,
                   regionTitle: regionTitle)
        
        self.stationId = stationId
        self.stationTitle = stationTitle == nil || stationTitle!.isEmpty ? nil : stationTitle
    }
    
    func getDescription() -> String {
        var result = ""
        result += self.countryTitle != nil ? "\(self.countryTitle!)" : ""
        result += self.cityTitle != nil ? ", \(self.cityTitle!)" : ""
        result += self.stationTitle != nil ? "\n\(self.stationTitle!)" : ""
        return result
    }
    
    func getReadableLocation() -> String {
        var result = self.countryTitle != nil ? "\(self.countryTitle!)" : ""
        result += self.regionTitle != nil ? ", \(self.regionTitle!)" : ""
        result += self.cityTitle != nil ? ", \(self.cityTitle!)" : ""
        return result
    }
}