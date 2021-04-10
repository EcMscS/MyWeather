//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/17/21.
//

import UIKit
import CoreLocation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let openWeatherAppID = "5d45ea72e4f8237b4804947b3c28aa14"
    private let unitChoice = "imperial"
    private let base = "https://api.openweathermap.org/data/2.5/weather?"
    private let baseURLOneCall = "https://api.openweathermap.org/data/2.5/onecall?"
    private let units = "&units="
    private let appID = "&appID="
    private let lat = "&lat="
    private let long = "&lon="
    private let exclude = "&exclude="
    
    private init() { }
    
    //Use of Queries to perform URL Request
    func getWeatherWithQueries(currentLocation: CLLocationCoordinate2D, completed: @escaping(Result<WeatherData, MWError>) -> Void) {
              
        let latitude = String(currentLocation.latitude)
        let longitude = String(currentLocation.longitude)
        
        let query: [String:String] = [
            "lat" : latitude,
            "lon" : longitude,
            "units" : unitChoice,
            "appID" : openWeatherAppID
        ]
        
        guard let baseURL = URL(string: base) else { return }
        
        guard let url = baseURL.withQueries(query) else {
            completed(.failure(MWError.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completed(.failure(MWError.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(MWError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(MWError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weatherJSONData = try decoder.decode(WeatherData.self, from: data)
                completed(.success(weatherJSONData))
            } catch {
                completed(.failure(MWError.invalidData))
            }
            
        }
        
        task.resume()
        
    }
    
    func getWeather(currentLocation: CLLocationCoordinate2D, completed: @escaping(Result<WeatherData, MWError>) -> Void) {
        
        //Latitude and Longitude coordinates as Double
        let latitude = String(currentLocation.latitude)
        let longitude = String(currentLocation.longitude)
        
        //Weather URL = baseURL + units + lat + long + appID
        let endpoint = base + lat + latitude + long + longitude + units + unitChoice + appID + openWeatherAppID
        
        //Test using testURL
        guard let url = URL(string: endpoint) else {
            assertionFailure("HMMMMM - URL PROBLEM")
            completed(.failure(MWError.unableToComplete))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                assertionFailure("FROM URLSession ERROR: \(error.localizedDescription)")
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                assertionFailure("ERROR from INVALID RESPONSE")
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                assertionFailure("ERROR FROM INVALID DATA")
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weatherJSONData = try decoder.decode(WeatherData.self, from: data)
                completed(.success(weatherJSONData))
            } catch {
                assertionFailure("ERROR FROM DECODER")
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
        
    }
    
    func getOneCallWeather(currentLocation: CLLocationCoordinate2D, completed: @escaping (Result<WeatherOneCall, MWError>) -> Void) {
        
        //Latitude and Longitude coordinates as Double
        let latitude = String(currentLocation.latitude)
        let longitude = String(currentLocation.longitude)
        
        //OneCallURL: baseURLOneCall + units + latitutde + longitude + exclude + appID
        let oneCallEndpoint = baseURLOneCall + units + unitChoice + lat + latitude + long + longitude + exclude + WeatherOneCallExclusion.excludeMinutesAndAlerts + appID + openWeatherAppID
        
        guard let url = URL(string: oneCallEndpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                assertionFailure("Error with URLSession with \(err.localizedDescription)")
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                assertionFailure("Error in HTTP URL Response")
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                assertionFailure("Error in data")
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weatherJSONOneCallData = try decoder.decode(WeatherOneCall.self, from: data)
                completed(.success(weatherJSONOneCallData))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
}
