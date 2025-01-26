//
//  SizeUpdater.swift
//  AemiUtilities
//
//  Created by Gigi on 26/01/25.
//

import SwiftUI

struct SizeUpdaterModifier: ViewModifier {
    @Binding var size: CGSize?
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizeKey.self, value: proxy.size)
                        .onPreferenceChange(SizeKey.self) { size = $0 }
                        .onAppear { size = proxy.size }
                }
            }
    }
    private struct SizeKey: PreferenceKey {
        typealias Value = CGSize
        static let defaultValue: CGSize = .zero
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
            value = nextValue()
        }
    }
}
