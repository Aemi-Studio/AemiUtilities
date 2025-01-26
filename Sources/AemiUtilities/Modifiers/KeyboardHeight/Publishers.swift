//
//  Publishers+KeyboardHeight.swift
//  AemiUtilities
//
//  Created by Gigi on 26/01/25.
//

import UIKit
import Combine

internal extension Publishers {

    static var keyboardHeight: AnyPublisher<CGFloat, Never> {

        let willShow = NotificationCenter.default.publisher(
            for: UIApplication.keyboardWillShowNotification
        )
        .map { $0.keyboardHeight }

        let willHide = NotificationCenter.default.publisher(
            for: UIApplication.keyboardWillHideNotification
        )
        .map { _ in CGFloat(0) }

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
