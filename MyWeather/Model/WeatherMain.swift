//
//  Weather.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/19/21.
//

import UIKit

struct WeatherMain {
    
    init() {
        conditionDescription = ""
        cityName = ""
        conditionID = 0
        temperature = 0
        coordinates = Coordinate(longitde: 0, latitude: 0)
        currentTime = 0
    }
    
    var conditionDescription: String
    var cityName: String
    var conditionID: Int
    var temperature: Double
    var coordinates: Coordinate
    var currentTime: Int

    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionImageName: String {
        switch conditionID {
        case 200...232:
            return "icon_thunderstorm_day"
        case 300...321:
            return "icon_rain_day"
        case 500...531:
            return "icon_shower_rain_day"
        case 600...622:
            return "icon_snow_day"
        case 701...781:
            return "icon_mist_day"
        case 800:
            return "icon_clear_sky_day"
        case 801...804:
            return "icon_thunderstorm_day"
        default:
            return "icon_broken_clouds_day"
        }
    }
    
}


