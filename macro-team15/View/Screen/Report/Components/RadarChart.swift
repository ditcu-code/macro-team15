//
//  RadarChart.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 22/11/22.
//

import SwiftUI

struct RadarChart: View {
    var data: [Int]
    var dataVersus: [Int]?
    var max: [Int]
    let gridColor: Color
    let dataColor: Color
    @Binding var scaleMonth: Double
    @Binding var scaleVersus: Double
    
    var body: some View {
        let shape1 = RadarChartPath(data: data.map{Double($0)}, max: max.map{Double($0)})
        ZStack {
            
            RadarChartGrid(categories: max.count, divisions: 10)
                .stroke(gridColor.opacity(0.5), lineWidth: 0.2)
            
            ZStack {
                shape1
                    .fill(dataColor)
                    .scaleEffect(scaleMonth)
                    .animation(.spring(), value: scaleMonth)
                shape1
                    .trim(from: 0, to: scaleMonth)
                    .stroke(dataColor, lineWidth: 2)
                    .animation(.easeIn(duration: 0.5), value: scaleMonth)
            }
            if let dataVersus = dataVersus {
                let shape2 = RadarChartPath(data: dataVersus.map{Double($0)}, max: max.map{Double($0)})
                
                ZStack {
                    shape2
                        .fill(Color.ui.secondary.opacity(0.4))
                        .scaleEffect(scaleVersus)
                        .animation(.spring(), value: scaleVersus)
                    shape2
                        .trim(from: 0, to: scaleVersus)
                        .stroke(Color.ui.secondary.opacity(0.4), lineWidth: 2)
                        .animation(.easeIn(duration: 0.5), value: scaleVersus)
                }.zIndex(scaleMonth < scaleVersus ? 10 : 0)
            }
            
        }
        .rotationEffect(.degrees(45))
        .onAppear {
            scaleMonth = 1
            scaleVersus = 1
        }
    }
}

//struct RadarChart_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        ZStack {
//            RadarChart(
//                data: [9, 14, 15, 20],
//                dataVersus: [10, 18, 19, 23],
//                max: [12, 20, 25, 35],
//                gridColor: .black,
//                dataColor: .green.opacity(0.3)
//            )
//        }
//    }
//}


struct RadarChartGrid: Shape {
    let categories: Int
    let divisions: Int
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
        let stride = radius / CGFloat(divisions)
        var path = Path()
        
        for category in 1 ... categories {
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + cos(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * radius,
                                     y: rect.midY + sin(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * radius))
        }
        
        for step in 1 ... divisions {
            let rad = CGFloat(step) * stride
            path.move(to: CGPoint(x: rect.midX + cos(-.pi / 2) * rad,
                                  y: rect.midY + sin(-.pi / 2) * rad))
            
            for category in 1 ... categories {
                path.addLine(to: CGPoint(x: rect.midX + cos(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * rad,
                                         y: rect.midY + sin(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * rad))
            }
        }
        
        return path
    }
}


struct RadarChartPath: Shape {
    var data: [Double]
    let max: [Double]
    
    func path(in rect: CGRect) -> Path {
        guard
            3 <= data.count,
            let minimum = data.min(),
            0 <= minimum
                //            let maximum = max.max()
        else { return Path() }
        
        let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
        var path = Path()
        
        for (index, entry) in data.enumerated() {
            switch index {
            case 0:
                path.move(to: CGPoint(
                    x: rect.midX + CGFloat(entry / max[index]) * cos(CGFloat(index) * 20 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                    y: rect.midY + CGFloat(entry / max[index]) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius)
                )
                
            default:
                path.addLine(to: CGPoint(
                    x: rect.midX + CGFloat(entry / max[index]) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                    y: rect.midY + CGFloat(entry / max[index]) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius)
                )
            }
        }
        
        path.closeSubpath()
        return path
    }
    
    var animatableData: [Double] {
        get { return data }
        set { data = newValue }
    }
}
