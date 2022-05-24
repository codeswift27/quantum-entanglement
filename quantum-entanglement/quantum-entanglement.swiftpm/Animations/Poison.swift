//
//  Poison.swift
//  
//
//  Created by Lexline Johnson on 23/04/2022.
//

import SwiftUI
import Combine

// ☠️
struct Poison: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    @State var isAnimated: Bool = false
    var points1 = [CGPoint(x: 0.2055, y: 0.0), CGPoint(x: 0.87, y: 0.0), CGPoint(x: 0.8877, y: 0.1298), CGPoint(x: 0.87, y: 0.0), CGPoint(x: 0.8877, y: 0.0), CGPoint(x: 0.87, y: 0.2598), CGPoint(x: 0.8877, y: 0.2598), CGPoint(x: 0.87, y: 0.2598), CGPoint(x: 0.9551, y: 0.2598), CGPoint(x: 0.9835, y: 0.4908), CGPoint(x: 0.9551, y: 0.2598), CGPoint(x: 0.9835, y: 0.2598), CGPoint(x: 0.9551, y: 0.7219), CGPoint(x: 0.9835, y: 0.7219), CGPoint(x: 0.9551, y: 0.7219), CGPoint(x: 0.6806, y: 0.7219), CGPoint(x: 0.6947, y: 0.861), CGPoint(x: 0.6806, y: 0.7219), CGPoint(x: 0.6947, y: 0.7219), CGPoint(x: 0.6806, y: 1.0), CGPoint(x: 0.6947, y: 1.0), CGPoint(x: 0.6806, y: 1.0), CGPoint(x: 0.1522, y: 1.0), CGPoint(x: 0.1365, y: 0.8783), CGPoint(x: 0.1522, y: 1.0), CGPoint(x: 0.1365, y: 1.0), CGPoint(x: 0.1522, y: 0.7564), CGPoint(x: 0.1365, y: 0.7564), CGPoint(x: 0.1522, y: 0.7564), CGPoint(x: 0.0483, y: 0.7564), CGPoint(x: 0.0165, y: 0.5081), CGPoint(x: 0.0483, y: 0.7564), CGPoint(x: 0.0165, y: 0.7564), CGPoint(x: 0.0483, y: 0.2598), CGPoint(x: 0.0165, y: 0.2598), CGPoint(x: 0.0483, y: 0.2598), CGPoint(x: 0.2055, y: 0.2598), CGPoint(x: 0.1887, y: 0.13), CGPoint(x: 0.2055, y: 0.2598), CGPoint(x: 0.1887, y: 0.2598), CGPoint(x: 0.2055, y: 0.0), CGPoint(x: 0.1887, y: 0.0), CGPoint(x: 0.2055, y: 0.0)]
    var points2 = [CGPoint(x: 0.2014, y: 0.0), CGPoint(x: 0.8761, y: 0.0), CGPoint(x: 0.8938, y: 0.1298), CGPoint(x: 0.8761, y: 0.0), CGPoint(x: 0.8938, y: 0.0), CGPoint(x: 0.8761, y: 0.2598), CGPoint(x: 0.8938, y: 0.2598), CGPoint(x: 0.8761, y: 0.2598), CGPoint(x: 0.9715, y: 0.2598), CGPoint(x: 1.0, y: 0.4908), CGPoint(x: 0.9715, y: 0.2598), CGPoint(x: 1.0, y: 0.2598), CGPoint(x: 0.9715, y: 0.7219), CGPoint(x: 1.0, y: 0.7219), CGPoint(x: 0.9715, y: 0.7219), CGPoint(x: 0.6826, y: 0.7219), CGPoint(x: 0.6967, y: 0.861), CGPoint(x: 0.6826, y: 0.7219), CGPoint(x: 0.6967, y: 0.7219), CGPoint(x: 0.6826, y: 1.0), CGPoint(x: 0.6967, y: 1.0), CGPoint(x: 0.6826, y: 1.0), CGPoint(x: 0.1481, y: 1.0), CGPoint(x: 0.1324, y: 0.8783), CGPoint(x: 0.1481, y: 1.0), CGPoint(x: 0.1324, y: 1.0), CGPoint(x: 0.1481, y: 0.7564), CGPoint(x: 0.1324, y: 0.7564), CGPoint(x: 0.1481, y: 0.7564), CGPoint(x: 0.0319, y: 0.7564), CGPoint(x: 0.0, y: 0.5081), CGPoint(x: 0.0319, y: 0.7564), CGPoint(x: 0.0, y: 0.7564), CGPoint(x: 0.0319, y: 0.2598), CGPoint(x: 0.0, y: 0.2598), CGPoint(x: 0.0319, y: 0.2598), CGPoint(x: 0.2014, y: 0.2598), CGPoint(x: 0.1846, y: 0.13), CGPoint(x: 0.2014, y: 0.2598), CGPoint(x: 0.1846, y: 0.2598), CGPoint(x: 0.2014, y: 0.0), CGPoint(x: 0.1846, y: 0.0), CGPoint(x: 0.2014, y: 0.0)]
    
    var body: some View {
        PoisonShape(points: isAnimated ? points2 : points1)
            .foregroundColor(Color(red: 156 / 255, green: 77 / 255, blue: 206 / 255, opacity: 1))
            .aspectRatio(486.3 / 57.92, contentMode: .fit)
            .animation(.easeInOut(duration: 2), value: isAnimated)
            .onReceive(timer) { input in
                if Calendar.current.component(.second, from: input) % 2 == 0 {
                    withAnimation {
                        isAnimated.toggle()
                    }
                }
            }
    }
}

struct PoisonShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 43 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addLine(to: CGPoint(x: points[1].x * width, y: points[1].y * height))
        path.addCurve(to: CGPoint(x: points[2].x * width, y: points[2].y * height), control1: CGPoint(x: points[3].x * width, y: points[3].y * height), control2: CGPoint(x: points[4].x * width, y: points[4].y * height))
        path.addCurve(to: CGPoint(x: points[5].x * width, y: points[5].y * height), control1: CGPoint(x: points[6].x * width, y: points[6].y * height), control2: CGPoint(x: points[7].x * width, y: points[7].y * height))
        path.addLine(to: CGPoint(x: points[8].x * width, y: points[8].y * height))
        path.addCurve(to: CGPoint(x: points[9].x * width, y: points[9].y * height), control1: CGPoint(x: points[10].x * width, y: points[10].y * height), control2: CGPoint(x: points[11].x * width, y: points[11].y * height))
        path.addCurve(to: CGPoint(x: points[12].x * width, y: points[12].y * height), control1: CGPoint(x: points[13].x * width, y: points[13].y * height), control2: CGPoint(x: points[14].x * width, y: points[14].y * height))
        path.addLine(to: CGPoint(x: points[15].x * width, y: points[15].y * height))
        path.addCurve(to: CGPoint(x: points[16].x * width, y: points[16].y * height), control1: CGPoint(x: points[17].x * width, y: points[17].y * height), control2: CGPoint(x: points[18].x * width, y: points[18].y * height))
        path.addCurve(to: CGPoint(x: points[19].x * width, y: points[19].y * height), control1: CGPoint(x: points[20].x * width, y: points[20].y * height), control2: CGPoint(x: points[21].x * width, y: points[21].y * height))
        path.addLine(to: CGPoint(x: points[22].x * width, y: points[22].y * height))
        path.addCurve(to: CGPoint(x: points[23].x * width, y: points[23].y * height), control1: CGPoint(x: points[24].x * width, y: points[24].y * height), control2: CGPoint(x: points[25].x * width, y: points[25].y * height))
        path.addCurve(to: CGPoint(x: points[26].x * width, y: points[26].y * height), control1: CGPoint(x: points[27].x * width, y: points[27].y * height), control2: CGPoint(x: points[28].x * width, y: points[28].y * height))
        path.addLine(to: CGPoint(x: points[29].x * width, y: points[29].y * height))
        path.addCurve(to: CGPoint(x: points[30].x * width, y: points[30].y * height), control1: CGPoint(x: points[31].x * width, y: points[31].y * height), control2: CGPoint(x: points[32].x * width, y: points[32].y * height))
        path.addCurve(to: CGPoint(x: points[33].x * width, y: points[33].y * height), control1: CGPoint(x: points[34].x * width, y: points[34].y * height), control2: CGPoint(x: points[35].x * width, y: points[35].y * height))
        path.addLine(to: CGPoint(x: points[36].x * width, y: points[36].y * height))
        path.addCurve(to: CGPoint(x: points[37].x * width, y: points[37].y * height), control1: CGPoint(x: points[38].x * width, y: points[38].y * height), control2: CGPoint(x: points[39].x * width, y: points[39].y * height))
        path.addCurve(to: CGPoint(x: points[40].x * width, y: points[40].y * height), control1: CGPoint(x: points[41].x * width, y: points[41].y * height), control2: CGPoint(x: points[42].x * width, y: points[42].y * height))
        path.closeSubpath()
        return path
    }
}
