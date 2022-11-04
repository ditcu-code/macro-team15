//
//  ContentView.swift
//  Test
//
//  Created by Cairocoders
//
 
import SwiftUI
 
struct StackedCircularProgress: View {
     
    @State var progressValue: Float = 0.0
     
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
             
            VStack {
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 200, height: 200)
                    .padding(40)
                 
                Button(action: {
                    self.incrementProgress()
                }) {
                    HStack {
                        Image(systemName: "plus.rectangle.fill")
                        Text("Increment")
                    }
                    .padding(15.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                 
                Spacer()
            }
        }
    }
     
    func incrementProgress() {
        let randomValue = Float([0.010, 0.020, 0.030, 0.040, 0.50].randomElement()!)
        self.progressValue += randomValue
    }
}
 
struct ProgressBar: View {
 
    @Binding var progress: Float
     
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 30)
                .opacity(0.6)
                .foregroundColor(Color.blue)
             
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
             
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}
 
struct StackedCircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        StackedCircularProgress()
    }
}
