//
//  Eyes.swift
//  
//
//  Created by Lexline Johnson on 24/04/2022.
//

import SwiftUI
import Combine


// 👁v👁
struct Eyes: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    @State var isAnimated: Bool = false
    @State var blink: Bool = false
    var irisPoints1 = [CGPoint(x: 0.1565, y: 0.1901), CGPoint(x: 0.1777, y: 0.2175), CGPoint(x: 0.1682, y: 0.1901), CGPoint(x: 0.1777, y: 0.2024), CGPoint(x: 0.1565, y: 0.2449), CGPoint(x: 0.1777, y: 0.2327), CGPoint(x: 0.1682, y: 0.2449), CGPoint(x: 0.1353, y: 0.2175), CGPoint(x: 0.1448, y: 0.2449), CGPoint(x: 0.1353, y: 0.2327), CGPoint(x: 0.1565, y: 0.1901), CGPoint(x: 0.1353, y: 0.2024), CGPoint(x: 0.1448, y: 0.1901)]
    var irisPoints2 = [CGPoint(x: 0.1068, y: 0.2248), CGPoint(x: 0.134, y: 0.2412), CGPoint(x: 0.1178, y: 0.2196), CGPoint(x: 0.13, y: 0.227), CGPoint(x: 0.1213, y: 0.2763), CGPoint(x: 0.138, y: 0.2554), CGPoint(x: 0.1323, y: 0.2711), CGPoint(x: 0.0941, y: 0.2599), CGPoint(x: 0.1103, y: 0.2814), CGPoint(x: 0.0981, y: 0.2741), CGPoint(x: 0.1068, y: 0.2248), CGPoint(x: 0.0901, y: 0.2457), CGPoint(x: 0.0958, y: 0.23)]
    var pupilPoints1 = [CGPoint(x: 0.1565, y: 0.198), CGPoint(x: 0.1717, y: 0.2175), CGPoint(x: 0.1649, y: 0.198), CGPoint(x: 0.1717, y: 0.2067), CGPoint(x: 0.1565, y: 0.2371), CGPoint(x: 0.1717, y: 0.2283), CGPoint(x: 0.1649, y: 0.2371), CGPoint(x: 0.1414, y: 0.2175), CGPoint(x: 0.1482, y: 0.2371), CGPoint(x: 0.1414, y: 0.2283), CGPoint(x: 0.1565, y: 0.198), CGPoint(x: 0.1414, y: 0.2067), CGPoint(x: 0.1482, y: 0.198)]
    var pupilPoints2 = [CGPoint(x: 0.1089, y: 0.2322), CGPoint(x: 0.1283, y: 0.2438), CGPoint(x: 0.1167, y: 0.2285), CGPoint(x: 0.1254, y: 0.2337), CGPoint(x: 0.1192, y: 0.2689), CGPoint(x: 0.1311, y: 0.254), CGPoint(x: 0.1271, y: 0.2652), CGPoint(x: 0.0998, y: 0.2572), CGPoint(x: 0.1114, y: 0.2726), CGPoint(x: 0.1027, y: 0.2674), CGPoint(x: 0.1089, y: 0.2322), CGPoint(x: 0.097, y: 0.2471), CGPoint(x: 0.101, y: 0.2359)]
    var xEyePoints1 = [CGPoint(x: 0.2322, y: 0.1954), CGPoint(x: 0.2665, y: 0.2397), CGPoint(x: 0.2322, y: 0.2397), CGPoint(x: 0.2665, y: 0.1954)]
    var xEyePoints2 = [CGPoint(x: 0.1793, y: 0.1962), CGPoint(x: 0.2233, y: 0.2228), CGPoint(x: 0.191, y: 0.2379), CGPoint(x: 0.2115, y: 0.1811)]
    
    var body: some View {
        ZStack {
            IrisShape(points: isAnimated ? irisPoints2 : irisPoints1)
                .foregroundColor(Color(red: 255 / 255, green: 215 / 255, blue: 82 / 255, opacity: 1))
                .mask(Rectangle()
                    .offset(x: 0, y: blink ? 100 : 0)
                )
            PupilShape(points: isAnimated ? pupilPoints2 : pupilPoints1)
                .foregroundColor(.black)
            XEyeShape(points: isAnimated ? xEyePoints2 : xEyePoints1)
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .foregroundColor(.white)
        }
        .aspectRatio(495.48 / 383.45, contentMode: .fit)
        .animation(.easeInOut(duration: 2), value: isAnimated)
        .onReceive(timer) { input in
            if Calendar.current.component(.second, from: input) % 4 == 0 {
                withAnimation {
                    isAnimated.toggle()
                }
            }
            if Calendar.current.component(.second, from: input) % 11 == 0 {
                withAnimation(.linear(duration: 0.5)) {
                    blink = true
                }
            }
            if Calendar.current.component(.second, from: input) % 11 == 1 {
                withAnimation(.linear(duration: 0.5)) {
                    blink = false
                }
            }
        }
    }
}

struct IrisShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 13 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addCurve(to: CGPoint(x: points[1].x * width, y: points[1].y * height), control1: CGPoint(x: points[2].x * width, y: points[2].y * height), control2: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        path.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        path.closeSubpath()
        return path
    }
}

struct PupilShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 13 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addCurve(to: CGPoint(x: points[1].x * width, y: points[1].y * height), control1: CGPoint(x: points[2].x * width, y: points[2].y * height), control2: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        path.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        path.closeSubpath()
        return path
    }
}

struct XEyeShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 4 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addLine(to: CGPoint(x: points[1].x * width, y: points[1].y * height))
        
        var line1 = Path()
        line1.move(to: CGPoint(x: points[2].x * width, y: points[2].y * height))
        line1.addLine(to: CGPoint(x: points[3].x * width, y: points[3].y * height))
        
        path.addPath(line1)
        return path
    }
}
