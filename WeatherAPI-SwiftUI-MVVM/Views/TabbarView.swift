//
//  TabbarView.swift
//  WeatherAPI-SwiftUI-MVVM
//
//  Created by Bhuiyan Wasif on 10/25/23.
//
//

import Foundation
import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            ForecastListView(viewModel: ForecastViewModel(apiService: APIService()))
                .tabItem {
                    Image(systemName: "calendar.circle")
                    Text("Forecast")
                }
            CurrentWeatherListView(viewModel: CurrentWeatherViewModel(apiService: APIService()))
            .tabItem {
                Image(systemName: "cloud.sun.fill")
                Text("Weather")
            }
        }
    }
}
