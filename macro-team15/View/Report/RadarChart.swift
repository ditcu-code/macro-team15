//
//  RadarChart.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 22/11/22.
//

import SwiftUI

struct RadarChart: View {
    @State var data: [Double]
    var dataVersus: [Double]?
    var max: [Double]
    let gridColor: Color
    let dataColor: Color
    @State private var pathProgress = 0.0
    
    var body: some View {
        ZStack {
            RadarChartGrid(categories: max.count, divisions: 10)
                .stroke(gridColor.opacity(0.5), lineWidth: 0.2)
            
            RadarChartPath(data: data, max: max).scaleEffect(pathProgress)
                .animation(.spring(), value: pathProgress)
            if let dataVersus = dataVersus {
                RadarChartPath(data: dataVersus, max: max)
                    .fill(dataColor)
            }
            Slider(value: $pathProgress, in: 0.0...1.0)
                            .padding()
        }.onAppear {
            withAnimation(.linear(duration: 4)) {
                data = [10.0, 18.0, 19.0, 23.0]
            }
            
        }
    }
}

struct RadarChart_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            RadarChart(
                data: [9.0, 14.0, 15.0, 20.0],
                dataVersus: [10.0, 18.0, 19.0, 23.0],
                max: [12.0, 20.0, 25.0, 35.0],
                gridColor: .black,
                dataColor: .green.opacity(0.3)
            )
        }
    }
}


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
