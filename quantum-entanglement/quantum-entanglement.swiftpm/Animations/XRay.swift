//
//  XRay.swift
//  
//
//  Created by Lexline Johnson on 17/04/2022.
//

import SwiftUI
import Combine

// 🦴🦴🦴
struct XRay: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    var strokeStyle: StrokeStyle?
    
    @State var centiseconds: Int = 0
    @State var animateCount: Int = 0
    var displayPoints1 = [CGPoint(x: 0.0835, y: 0.1261), CGPoint(x: 0.6497, y: 0.0268), CGPoint(x: 0.6918, y: 0.0738), CGPoint(x: 0.6704, y: 0.0232), CGPoint(x: 0.6893, y: 0.0442), CGPoint(x: 0.7372, y: 0.6007), CGPoint(x: 0.7042, y: 0.6609), CGPoint(x: 0.7397, y: 0.6303), CGPoint(x: 0.7249, y: 0.6573), CGPoint(x: 0.1381, y: 0.7601), CGPoint(x: 0.0959, y: 0.7131), CGPoint(x: 0.1174, y: 0.7638), CGPoint(x: 0.0985, y: 0.7427), CGPoint(x: 0.0506, y: 0.1862), CGPoint(x: 0.0835, y: 0.1261), CGPoint(x: 0.0481, y: 0.1566), CGPoint(x: 0.0628, y: 0.1297)]
    var displayPoints2 = [CGPoint(x: 0.0588, y: 0.2614), CGPoint(x: 0.6146, y: 0.0783), CGPoint(x: 0.6599, y: 0.1187), CGPoint(x: 0.6349, y: 0.0716), CGPoint(x: 0.6552, y: 0.0897), CGPoint(x: 0.7436, y: 0.636), CGPoint(x: 0.7152, y: 0.7007), CGPoint(x: 0.7483, y: 0.665), CGPoint(x: 0.7356, y: 0.694), CGPoint(x: 0.1595, y: 0.8839), CGPoint(x: 0.1141, y: 0.8434), CGPoint(x: 0.1391, y: 0.8906), CGPoint(x: 0.1188, y: 0.8725), CGPoint(x: 0.0305, y: 0.3262), CGPoint(x: 0.0588, y: 0.2614), CGPoint(x: 0.0258, y: 0.2971), CGPoint(x: 0.0384, y: 0.2681)]
    var framePoints1 = [CGPoint(x: 0.7292, y: 0.4924), CGPoint(x: 0.8624, y: 0.3814), CGPoint(x: 0.8739, y: 0.5541), CGPoint(x: 0.9759, y: 0.5307), CGPoint(x: 0.8962, y: 0.9521)]
    var framePoints2 = [CGPoint(x: 0.7278, y: 0.5294), CGPoint(x: 0.852, y: 0.3992), CGPoint(x: 0.8761, y: 0.5692), CGPoint(x: 0.9759, y: 0.5307), CGPoint(x: 0.8962, y: 0.9521)]
    var basePoints1 = [CGPoint(x: 0.8193, y: 0.9447), CGPoint(x: 0.9769, y: 0.9447), CGPoint(x: 0.999, y: 1.0), CGPoint(x: 0.7973, y: 1.0)]
    var basePoints2 = [CGPoint(x: 0.8193, y: 0.9447), CGPoint(x: 0.9769, y: 0.9447), CGPoint(x: 0.999, y: 1.0), CGPoint(x: 0.7973, y: 1.0)]
    
    var body: some View {
        Group {
            if let strokeStyle = strokeStyle {
                ZStack {
                    XRayDisplayShape(points: animateCount == 1 ? displayPoints2 : displayPoints1)
                        .stroke(style: strokeStyle)
                    XRayFrameShape(points: animateCount == 1 ? framePoints2 : framePoints1)
                        .stroke(style: strokeStyle)
                    XRayBaseShape(points: animateCount == 1 ? basePoints2 : basePoints1)
                }
            } else {
                XRayDisplayShape(points: animateCount == 1 ? displayPoints2 : displayPoints1)
            }
        }
        .foregroundColor(.white)
        .aspectRatio(317.33 / 222.28, contentMode: .fit)
        .animation(.easeInOut(duration: 0.75), value: animateCount)
        .onReceive(timer) { input in
            if animateCount == 2 {
                return
            } else if animateCount == 0 || centiseconds == 75 {
                animateCount += 1
            }
            centiseconds += 1
        }
        .onAppear {
            animateCount = 0
            centiseconds = 0
        }
    }
}

struct XRayDisplayShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 17 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addLine(to: CGPoint(x: points[1].x * width, y: points[1].y * height))
        path.addCurve(to: CGPoint(x: points[2].x * width, y: points[2].y * height), control1: CGPoint(x: points[3].x * width, y: points[3].y * height), control2: CGPoint(x: points[4].x * width, y: points[4].y * height))
        path.addLine(to: CGPoint(x: points[5].x * width, y: points[5].y * height))
        path.addCurve(to: CGPoint(x: points[6].x * width, y: points[6].y * height), control1: CGPoint(x: points[7].x * width, y: points[7].y * height), control2: CGPoint(x: points[8].x * width, y: points[8].y * height))
        path.addLine(to: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        path.addLine(to: CGPoint(x: points[13].x * width, y: points[13].y * height))
        path.addCurve(to: CGPoint(x: points[14].x * width, y: points[14].y * height), control1: CGPoint(x: points[15].x * width, y: points[15].y * height), control2: CGPoint(x: points[16].x * width, y: points[16].y * height))
        path.closeSubpath()
        return path
    }
}

struct XRayFrameShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 5 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addLine(to: CGPoint(x: points[1].x * width, y: points[1].y * height))
        path.addLine(to: CGPoint(x: points[2].x * width, y: points[2].y * height))
        path.addLine(to: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addLine(to: CGPoint(x: points[4].x * width, y: points[4].y * height))
        return path
    }
}

struct XRayBaseShape: Shape {
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
        path.addLine(to: CGPoint(x: points[2].x * width, y: points[2].y * height))
        path.addLine(to: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.closeSubpath()
        return path
    }
}
