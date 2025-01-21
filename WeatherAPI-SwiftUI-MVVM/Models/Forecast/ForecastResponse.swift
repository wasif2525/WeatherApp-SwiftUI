//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

// MARK: - Welcome
struct ForecastResponse: Codable {
    let cod: String?
    let message, cnt: Int?
    let list: [Forecast]
    let city: City
}

struct PresentableForecast: Identifiable {
    let weekDay: String
    let name: String
    let forecast: [Forecast]
    var id: String {
        return weekDay
    }
}
