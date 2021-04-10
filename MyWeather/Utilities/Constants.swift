//
//  Constants.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/15/21.
//

import UIKit

enum SFSymbols {
    static let location = UIImage(systemName: "mappin.and.ellipse")
}

enum WeatherImages {
    static let cloudyDay = UIImage(named: "icon_broken_clouds_day")
    static let cloudyNight = UIImage(named: "icon_broken_clouds_night")
    static let clearSkyDay = UIImage(named: "icon_clear_sky_day")
    static let clearSkyNight = UIImage(named: "icon_clear_sky_night")
    static let fewCloudsDay = UIImage(named: "icon_few_clouds_day")
    static let fewCloudNight = UIImage(named: "icon_few_clouds_night")
    static let mistyDay = UIImage(named: "icon_mist_day")
    static let rainDay = UIImage(named: "icon_rain_day")
    static let rainNight = UIImage(named: "icon_rain_night")
    static let scatteredCloudsNight = UIImage(named: "icon_scattered_clouds_night")
    static let showerRainDay = UIImage(named: "icon_shower_rain_day")
    static let showerRainNight = UIImage(named: "icon_shower_rain_night")
    static let snowDay = UIImage(named: "icon_snow_day")
    static let thunderstormDay = UIImage(named: "icon_thunderstorm_day")
    static let thunderstormNight = UIImage(named: "icone_thunderstorm_night")
}

enum CustomIcons {
    static let customCurrentLocation = UIImage(named: "currentLocation")
    static let selectedBar = UIImage(named: "Bottom_Bar")
}

enum TimeOfDay {
    static let dayTime = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    static let nightTime = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
}

enum TimeSegments {
    static let times = ["Today", "Week"]
}

enum BackgroundImages {
    static let weatherBackground = UIImage(named: "weatherBackground")
}

enum CustomColors {
    static let backgroundColorForCollectionCell = UIColor(named: "backgroundColors")
}

enum CustomFont {
    static let temperatureLabelFont = "GillSans-Bold"
}

enum TestingURL {
    //Test Working URL
    static let testURL = "https://api.openweathermap.org/data/.5/weather?&units=imperial&appid=5d45ea72e4f8237b4804947b3c28aa14&q=Los%20Angeles"
    static let testURL2 = "https://api.openweathermap.org/data/2.5/weather?&units=imperial&appid=5d45ea72e4f8237b4804947b3c28aa14&q=London"
    static let testURL3 = "https://api.openweathermap.org/data/2.5/weather?&units=imperial&lat=35&lon=139&appid=5d45ea72e4f8237b4804947b3c28aa14"
    static let oneCallURL = "https://api.openweathermap.org/data/2.5/onecall?&units=imperial&lat=51.5085&lon=-0.1257&exclude=minutely,alerts&appid=5d45ea72e4f8237b4804947b3c28aa14"
}

enum WeatherOneCallExclusion {
    static let excludeMinutesAndAlerts = "minutely,alerts"
    static let excludeAll = "hourly,daily,minutely,alerts"
}
