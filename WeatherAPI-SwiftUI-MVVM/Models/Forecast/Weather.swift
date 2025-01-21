//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

// MARK: - Weather
struct Weather: Codable, Identifiable, Equatable {
    let id: Int?
    let main: MainEnum?
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
