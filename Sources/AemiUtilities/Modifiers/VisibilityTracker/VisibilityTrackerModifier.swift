//
//  VisibilityTrackerModifier.swift
//  AemiUtilities
//
//  Created by Gigi on 29/03/25.
//

import UIKit
import SwiftUICore

struct VisibilityTrackerModifier: ViewModifier {
    @State private var bounds: CGRect = .zero
    
    private let threshold: CGFloat
    private let coordinateSpace: CoordinateSpace
    @Binding private var isVisible: Bool
    @Binding private var visibility: CGFloat
    private let containerBounds: Binding<CGRect>?

    init(
        threshold: Double,
        coordinateSpace: CoordinateSpace,
        isVisible: Binding<Bool>,
        visibility: Binding<CGFloat>,
        containerBounds: Binding<CGRect>? = nil
    ) {
        self.threshold = threshold
        self.coordinateSpace = coordinateSpace
        self._isVisible = isVisible
        self._visibility = visibility
        self.containerBounds = containerBounds
    }
    
    func body(content: Content) -> some View {
        content
            .track(bounds: $bounds, in: coordinateSpace)
            .versionAgnosticOnChange(of: bounds) { bounds in
                updateVisibilty(bounds: bounds, in: containerBounds?.wrappedValue)
            }
    }

    private func updateVisibilty(
        bounds: CGRect,
        in container: CGRect? = UIApplication.currentScreen?.bounds
    ) {
        guard let container = container ?? UIApplication.currentScreen?.bounds else { return }

        let viewEndY = bounds.origin.y + bounds.height
        let viewEndX = bounds.origin.x + bounds.width
        let containerEndY = container.origin.y + container.height
        let containerEndX = container.origin.x + container.width
        
        let visibleHeight = min(containerEndY, viewEndY) - max(container.origin.y, bounds.origin.y)
        let visibleWidth = min(containerEndX, viewEndX) - max(container.origin.x, bounds.origin.x)
        
        let visibleArea = visibleHeight * visibleWidth
        let viewArea = bounds.height * bounds.width
        
        let visibility = visibleArea / viewArea
        self.visibility = min(max(visibility, 0), 1)
        
        let isVisible = bounds.intersects(container)
        if self.isVisible != isVisible {
            self.isVisible = isVisible
        }
    }
}
