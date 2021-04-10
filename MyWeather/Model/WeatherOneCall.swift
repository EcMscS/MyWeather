//
//  WeatherOneCall.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/20/21.
//

import Foundation

struct WeatherOneCall: Decodable {
    
    let lat : Double
    let lon : Double
    let timezone : String
    let timezoneOffset : Int
    let current : Current
    let hourly : [Hourly]
    let daily: [Daily]

}

struct Current : Decodable {
    let dt : Int
    let sunrise : Int?
    let sunset : Int?
    let temp : Double
    let feelsLike : Double
    let pressure : Int
    let humidity : Int
    let dewPoint : Double
    let uvi : Double
    let clouds : Int
    let visibility : Int
    let windSpeed : Double
    let windGust : Double?
    let windDeg : Int
    let weather : [Weather]
    let pop: Int?
    let rain: Double?
    let snow: Double?
}

struct Hourly: Decodable {
    let dt : Int
    let temp : Double
    let feelsLike : Double
    let pressure : Int
    let humidity : Int
    let dewPoint : Double
    let uvi : Double
    let clouds : Int
    let visibility : Int
    let windSpeed : Double
    let windGust : Double?
    let windDeg : Int
    let weather : [Weather]
    let pop : Double
    let rain: Rain?
    let snow: Double?
}

struct Daily: Decodable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let pop, uvi: Double
    let rain: Double?
}

struct FeelsLike: Decodable {
    let day, night, eve, morn: Double
}

struct Temp: Decodable {
    let day, min, max, night: Double
    let eve, morn: Double
}

struct Rain: Decodable {
    let oneHour: Double
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
