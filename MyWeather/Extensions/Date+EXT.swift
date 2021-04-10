//
//  Date+EXT.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/20/21.
//

import Foundation


extension Date {
    
    //Returns as Full Format : Example Friday, March 12, 2021
    func getCurrentDate() -> String {
        
        let currentDay = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        return formatter.string(from: currentDay)
        
    }
    
}
