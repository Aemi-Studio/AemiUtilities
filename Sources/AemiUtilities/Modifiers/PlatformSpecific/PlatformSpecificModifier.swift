//
//  PlatformSpecificModifier.swift
//  AemiUtilities
//
//  Created by Gigi on 10/03/25.
//

import SwiftUI

// Custom ViewModifier that applies the modifiers only for the specified platform
public struct PlatformSpecificModifier: ViewModifier {

    typealias Target = (any View)
    typealias Other = (any View)

    let target: Platform
    let builder: (Content) -> Target
    let counterBuilder: ((Content) -> Other)?

    public func body(content: Content) -> some View {
        if Platform.is(target) {
            AnyView(self.builder(content))
        } else {
            counterBuilder != nil
                ? AnyView(self.counterBuilder!(content))
                : AnyView(content)
        }
    }
}

// View extension for easy use of the PlatformSpecificModifier
public extension View {
    func `for`(
        _ target: Platform,
        @ViewBuilder builder: @escaping (PlatformSpecificModifier.Content) -> some View,
        @ViewBuilder else: @escaping (PlatformSpecificModifier.Content) -> some View = { $0 }
    ) -> some View {
        self.modifier(
            PlatformSpecificModifier(
                target: target,
                builder: builder,
                counterBuilder: `else`
            )
        )
    }
}
