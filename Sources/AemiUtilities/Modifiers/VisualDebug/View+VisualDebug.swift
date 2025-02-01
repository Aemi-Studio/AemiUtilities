//
//  View+VisualDebug.swift
//  AemiUtilities
//
//  Created by Gigi on 26/01/25.
//

import SwiftUI

public extension View {
    func debug(_ color: Color = .red, showDimensions: Bool = false) -> some View {
        modifier(VisualDebugModifier(color, showDimensions: showDimensions))
    }
}
