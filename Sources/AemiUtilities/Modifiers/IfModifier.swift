//
//  IfModifier.swift
//  AemiUtilities
//
//  Created by Gigi on 28/01/25.
//

import SwiftUI

extension View {

    @ViewBuilder
    public func `if`(_ condition: Bool...) -> some View {
        if condition.allSatisfy({ $0 }) {
            self
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    public func `if`(_ condition: Bool, @ViewBuilder modifier: @escaping (Self) -> some View) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }

    @ViewBuilder
    public func `if`(_ condition: Binding<Bool>, @ViewBuilder modifier: @escaping (Self) -> some View) -> some View {
        if condition.wrappedValue {
            modifier(self)
        } else {
            self
        }
    }

}
