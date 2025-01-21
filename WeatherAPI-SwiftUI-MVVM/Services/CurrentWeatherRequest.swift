//
//  CurrentWeatherService.swift
//  WeatherAPI-SwiftUI-MVVM
//
//  Created by Bhuiyan Wasif on 10/25/23.
//
//

import Foundation

struct CurrentWeatherRequest: APIRequestType {
    
    typealias Response = CurrentWeatherResponse
    
    init(_ params: [String: String]) {
        queryParams = params
    }
    
    var queryParams: [String : String]
    var path: String { return "/data/2.5/weather" }
    var queryItems: [URLQueryItem]? {
        return queryParams.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
    }
}
