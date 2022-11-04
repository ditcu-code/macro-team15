//
//  StackCircularProgress.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 03/11/22.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeWidth = 25.0
    
//    var progress: Double
//    var total: Double
    var values: [Double]
    var index: Int
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        let progress = values[0]
        let total = values[1]
        
        print(configuration)
        
        return ZStack {
            let percentage: Int = Int(progress / total * 100)
            Circle()
                .trim(from: 0.0, to: fractionCompleted)
                .stroke(.green, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round, lineJoin: .bevel))
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.0, to: 0.1)
                .stroke(.green, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(90))
                            .zIndex(1.0)
            Circle()
                .trim(from: 0.2, to: 0.5)
                .stroke(.yellow, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.5, to: 0.6)
                .stroke(.orange, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.6, to: 1)
                .stroke(.red, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(90))
            Text("\(percentage) %")
                .bold()
                .font(.largeTitle)
        }
    }
}

struct StackCircularProgress: View {
    var values: [Double]
    
    var body: some View {
        let totalValue = values.reduce(0, +)
        
        ZStack {
            ForEach(values, id: \.self) { item in
                ProgressView(value: item, total: totalValue)
                    .progressViewStyle(GaugeProgressStyle(values: values, index: 1))
                    .frame(width: 175, height: 175)
                    .padding(.top, 5)
                    .padding(.bottom, 20)
                    .animation(.easeInOut(duration: 1), value: totalValue)
            }
        }
    }
}

struct StackCircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        StackCircularProgress(values: [50, 100])
    }
}
