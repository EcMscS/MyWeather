//
//  WeatherSub.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 3/17/21.
//

import Foundation

struct WeatherSub {
    
    init() {
        conditionID = 0
        temperature = 0
        coordinates = Coordinate(longitde: 0, latitude: 0)
        currentTime = 0
        hourly = [Hourly]()
        daily = [Daily]()
    }
    
    var conditionID: Int
    var temperature: Double
    var coordinates: Coordinate
    var currentTime: Int
    var hourly: [Hourly]
    var daily: [Daily]
    

    //Input: time is in Unix Timestamp
    func convertFromUnixTimeToCurrentTime(time: Int) -> String {

        let date = Date(timeIntervalSince1970: TimeInterval(time))

        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.timeZone = .current
        timeFormatter.amSymbol = "AM"
        timeFormatter.pmSymbol = "PM"
        timeFormatter.dateFormat = "h a"

        return timeFormatter.string(from: date)
    }

    func convertFromUnixTimeToCurrentDay(time: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"

        return dateFormatter.string(from: date)
    }
    
    func convertTempDoubleToString(temp: Double) -> String {
        return String(format: "%.1f", temp) + "°"
    }
    
    func retrieveWeatherIconName(condID: Int) -> String {
        switch condID {
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
    
    func hourlyTimes() -> [String] {

        var hoursList = [String]()

        for index in 1..<5 {
            let each = convertFromUnixTimeToCurrentTime(time: hourly[index].dt)
            hoursList.append(each)
        }

        return hoursList
    }
    
}

struct Coordinate {
    var longitde: Double
    var latitude: Double
}

