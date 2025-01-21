//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

// MARK: - City
struct City: Codable, Equatable {

    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}
