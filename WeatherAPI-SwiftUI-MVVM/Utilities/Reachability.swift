//
//  Reachability.swift
//  WeatherAPI-SwiftUI-MVVM
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation
import SystemConfiguration

public class Reachability {

    open class var isConnectedToNetwork: Bool {
    get {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard
            let defaultRouteReachability: SCNetworkReachability = withUnsafePointer(to: &zeroAddress, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(nil, $0)
                }
            }),
            var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags() as SCNetworkReachabilityFlags?,
            SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags)
            else { return false }

        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
    
    }

}
