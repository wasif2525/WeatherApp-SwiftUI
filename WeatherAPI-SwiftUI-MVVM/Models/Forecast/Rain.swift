//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

// MARK: - Rain
struct Rain: Codable, Equatable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
