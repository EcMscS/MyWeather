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
}

enum TimeOfDay {
    static let dayTime = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    static let nightTime = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
}

enum timeSegments {
    static let times = ["Yesterday", "Today", "Week"]
}
