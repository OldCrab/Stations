//
//  JSONParser.swift
//  Stations
//
//  Created by OldMan on 19/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import Foundation

class JSONParser {
    func parseAllCities(json: NSData) -> [String : [City]]{
        
        var result = [String : [City]]()
        
        guard let allCities = try? NSJSONSerialization.JSONObjectWithData(json, options: .MutableContainers) as? NSDictionary else {
            return result
        }
        
        if let uAllCities = allCities {
            for (key, value) in uAllCities {
                guard let stringKey  = key as? String, let arrayValue = value as? NSArray else {
                    continue
                }
                result[stringKey] = parseCities(arrayValue)
            }
        }
        return result
    }

    func parseCities(cities: NSArray) -> [City] {
        
        var result = [City]()
        
        for city in cities {
            if city as? NSDictionary != nil {
                result.append(parseCity(city as! NSDictionary))
            }
        }
        
        return result
    }
    
    func parseCity(city: NSDictionary) -> City {
//        {
//            "countryTitle" : "Россия", //название страны
//            "point" : { //координаты города
//                "longitude" : 50.64357376098633,
//                "latitude" : 55.37233352661133
//            },
//            "districtTitle" : "Чистопольский район", //название района
//            "cityId" : 4454, //идентификатор города
//            "cityTitle" : "Чистополь", //название города
//            "regionTitle" : "Республика Татарстан", //название региона
//            "stations" : [...] //массив станций
//        }
        return City(countryTitle: city["countryTitle"] as? String,
                    point: parsePoint(city["point"] as? NSDictionary),
                    districtTitle: city["districtTitle"] as? String,
                    cityID: city["cityId"] as? Int,
                    cityTitle: city["cityTitle"] as? String,
                    regionTitle: city["regionTitle"] as? String,
                    stations: parseStations(city["stations"] as? NSArray ?? []) )
    }
    
    func parsePoint(point: NSDictionary?) -> Point? {
        return Point(longtitude: point?["longitude"] as? NSNumber, latitude: point?["latitude"] as? NSNumber)
    }
    
    func parseStations(stations: NSArray) -> [Station] {
        var result = [Station]()
        
        for station in stations {
            if let dict = station as? NSDictionary {
                result.append(parseStation(dict))
            }
        }
        
        return result
    }
    
    func parseStation(station: NSDictionary) -> Station {
//        {
//            "countryTitle" : "Россия", //название страны (денормализация данных, дубль из города)
//            "point" : { //координаты станции (в общем случае отличаются от координат города)
//                "longitude" : 50.64357376098633,
//                "latitude" : 55.37233352661133
//            },
//            
//            "districtTitle" : "Чистопольский район", //название района
//            "cityId" : 4454, //идентификатор города
//            "cityTitle" : "город Чистополь", //название города
//            "regionTitle" : "Республика Татарстан", //название региона
//            
//            "stationId" : 9362, //идентификатор станции
//            "stationTitle" : "Чистополь" //полное название станции
//        }
        return Station(countryTitle: station["countryTitle"] as? String,
                       point: parsePoint(station["point"] as? NSDictionary),
                    districtTitle: station["districtTitle"] as? String,
                    cityID: station["cityId"] as? Int,
                    cityTitle: station["cityTitle"] as? String,
                    regionTitle: station["regionTitle"] as? String,
                    stationId: station["stationId"] as? Int,
                    stationTitle: station["stationTitle"] as? String)
    }
}