//
//  View.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

extension View {
    
    var asImage: UIImage {
        // Must ignore safe area due to a bug in iOS 15+ https://stackoverflow.com/a/69819567/1011161
        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.top))
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: targetSize)
        view?.backgroundColor = .clear

        let format = UIGraphicsImageRendererFormat()
        format.scale = 3 // Ensures 3x-scale images. You can customise this however you like.
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

