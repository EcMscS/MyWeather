//
//  URL+EXT.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 3/24/21.
//

import UIKit

extension URL {
    
    func withQueries(_ queries: [String:String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
    
}
