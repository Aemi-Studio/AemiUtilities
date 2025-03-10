//
//  Platform.swift
//  AemiUtilities
//
//  Created by Gigi on 10/03/25.
//

import Foundation

#if os(iOS)
import UIKit
#endif

@MainActor
public enum Platform {
    case pad
    case phone
    case mac
    case watch
    case tv
    case car
    case vision
    case unknown
    
    static func `is`(_ target: Self) -> Bool {
        target == .current
    }
    
    static var current: Platform {
#if os(macOS)
        .mac
#elseif os(watchOS)
        .watch
#elseif os(tvOS)
        .tv
#else
        switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                    .phone
            case .pad:
                    .pad
            case .tv:
                    .tv
            case .carPlay:
                    .car
            case .mac:
                    .mac
            case .vision:
                    .vision
            case .unspecified:
                    .unknown
            @unknown default:
                    .unknown
        }
#endif
    }
}
