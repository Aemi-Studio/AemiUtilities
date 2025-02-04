//
//  SafeAreaInsets.swift
//  AemiUtilities
//
//  Created by Gigi on 04/02/25.
//

import SwiftUI
import UIKit

@MainActor
private struct SafeAreaInsetsKey: @preconcurrency EnvironmentKey {
    static var defaultValue: EdgeInsets {
        if let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
           let insets = windowScene.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets
        {
            EdgeInsets(
                top: insets.top,
                leading: insets.left,
                bottom: insets.bottom,
                trailing: insets.right
            )
        } else {
            EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        }
    }
}

public extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsKey.self] }
        set { }
    }
}
