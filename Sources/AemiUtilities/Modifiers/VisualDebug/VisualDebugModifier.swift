//
//  DebugModifier.swift
//  AemiUtilities
//
//  Created by Gigi on 26/01/25.
//

import SwiftUI

struct VisualDebugModifier: ViewModifier {
    
    let color: Color
    
    @State
    private var size: CGSize? = .zero
    
    init(_ color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { _ in
                    Rectangle()
                        .stroke(color, lineWidth: 0.5)
                        .foregroundStyle(.clear)
                        .background(color.opacity(0.15))
                        .allowsHitTesting(false)
                        .update($size)
                }
            }
            .overlay(alignment: .topTrailing) { sizeOverlay }
    }
    
    @ViewBuilder
    var sizeOverlay: some View {
        HStack {
            Text(size!.width, format: .number.precision(.fractionLength(2)).locale(.autoupdatingCurrent))
            + Text("w × ")
            + Text(size!.height, format: .number.precision(.fractionLength(2)).locale(.autoupdatingCurrent))
            + Text("h")
        }
        .font(.caption2)
        .fontWidth(.condensed)
        .fontWeight(.bold)
        .shadow(color: .black, radius: 0.5)
        .padding(4)
        .foregroundStyle(.white)
        .background(color.opacity(0.4))
        .clipShape(.rect)
        .overlay {
            Rectangle()
                .stroke(color.opacity(0.4), lineWidth: 0.5)
                .foregroundStyle(.clear)
        }
    }
}
