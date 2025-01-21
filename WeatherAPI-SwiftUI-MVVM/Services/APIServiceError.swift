//
//  APIServiceError.swift
//  SwiftUI-MVVM
//
//  Created by Bhuiyan Wasif on 10/25/23.
//
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case networkError
    case parseError(Error)
    case locationNotFound
    
    var localizedDescription: String {
        switch self {
        case .responseError: return "network error"
        case .parseError: return "Invalid response from server, error in typing."
        case .networkError: return "Network is not available, please try again later."
        case .locationNotFound: return "Your current location not found."
        }
    }
}

