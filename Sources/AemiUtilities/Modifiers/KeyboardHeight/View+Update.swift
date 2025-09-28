//
//  View+Update.swift
//  AemiUtilities
//
//  Created by Gigi on 26/01/25.
//

import Combine
import SwiftUI

public extension View {
    func update(keyboardSize: Binding<CGFloat?>) -> some View {
        onReceive(Publishers.keyboardHeight) { keyboardSize.wrappedValue = $0 }
    }
}
