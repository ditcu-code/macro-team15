//
//  Shapes.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        let corners = corners(center: center, radius: radius)
        path.move(to: corners[0])
        corners[1...5].forEach() { point in
            path.addLine(to: point)
        }
        path.closeSubpath()
        return path
    }

    func corners(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...5) {
          let angle = CGFloat.pi / 3 * CGFloat(i)
          let point = CGPoint(
            x: center.x + radius * cos(angle),
            y: center.y + radius * sin(angle)
          )
          points.append(point)
        }
        return points
    }
}
