//
//  MWError.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/20/21.
//

import Foundation

enum MWError: String, Error {
    
    case unableToComplete = "Unable to complete your request, please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid, please try again"
    
}
