//
//  Cat.swift
//  
//
//  Created by Lexline Johnson on 11/04/2022.
//

import SwiftUI
import RealityKit
import Combine

// Meow 🐾
struct Cat: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    @State var meow: Int = 0
    @State var isAnimated: Bool = false
    var points1 = [CGPoint(x: 0.0904, y: 0.0216), CGPoint(x: 0.1468, y: 0.1144), CGPoint(x: 0.2591, y: 0.1144), CGPoint(x: 0.3068, y: 0.0216), CGPoint(x: 0.324, y: 0.1634), CGPoint(x: 0.3068, y: 0.0216), CGPoint(x: 0.3218, y: 0.0884), CGPoint(x: 0.3524, y: 0.3727), CGPoint(x: 0.3262, y: 0.2384), CGPoint(x: 0.3303, y: 0.3548), CGPoint(x: 0.5115, y: 0.4154), CGPoint(x: 0.3744, y: 0.3906), CGPoint(x: 0.4561, y: 0.3804), CGPoint(x: 0.6631, y: 0.6491), CGPoint(x: 0.5669, y: 0.4504), CGPoint(x: 0.6336, y: 0.5327), CGPoint(x: 0.692, y: 0.8562), CGPoint(x: 0.6927, y: 0.7654), CGPoint(x: 0.692, y: 0.8562), CGPoint(x: 0.8198, y: 0.8562), CGPoint(x: 0.9882, y: 0.9069), CGPoint(x: 0.8198, y: 0.8562), CGPoint(x: 0.9576, y: 0.8521), CGPoint(x: 0.9587, y: 0.9957), CGPoint(x: 1.0187, y: 0.9616), CGPoint(x: 0.9833, y: 0.9931), CGPoint(x: 0.8683, y: 0.9744), CGPoint(x: 0.9341, y: 0.9983), CGPoint(x: 0.8729, y: 1.0112), CGPoint(x: 0.7194, y: 0.9487), CGPoint(x: 0.8637, y: 0.9377), CGPoint(x: 0.7802, y: 0.9487), CGPoint(x: 0.1384, y: 0.9487), CGPoint(x: 0.6587, y: 0.9487), CGPoint(x: 0.1384, y: 0.9487), CGPoint(x: 0.0809, y: 0.4946), CGPoint(x: 0.1384, y: 0.9487), CGPoint(x: 0.0929, y: 0.7264), CGPoint(x: 0.0904, y: 0.0216), CGPoint(x: 0.0689, y: 0.2629), CGPoint(x: 0.0904, y: 0.0216)]
    var points2 = [CGPoint(x: 0.0, y: 0.0957), CGPoint(x: 0.0776, y: 0.1579), CGPoint(x: 0.1831, y: 0.1083), CGPoint(x: 0.2034, y: 0.0), CGPoint(x: 0.2571, y: 0.1257), CGPoint(x: 0.2034, y: 0.0), CGPoint(x: 0.2352, y: 0.0562), CGPoint(x: 0.3391, y: 0.3098), CGPoint(x: 0.2791, y: 0.1951), CGPoint(x: 0.3137, y: 0.287), CGPoint(x: 0.5115, y: 0.4154), CGPoint(x: 0.3646, y: 0.3327), CGPoint(x: 0.4561, y: 0.3804), CGPoint(x: 0.6631, y: 0.6491), CGPoint(x: 0.5669, y: 0.4504), CGPoint(x: 0.6336, y: 0.5327), CGPoint(x: 0.692, y: 0.8562), CGPoint(x: 0.6927, y: 0.7654), CGPoint(x: 0.692, y: 0.8562), CGPoint(x: 0.8198, y: 0.8562), CGPoint(x: 0.9882, y: 0.9069), CGPoint(x: 0.8198, y: 0.8562), CGPoint(x: 0.9576, y: 0.8521), CGPoint(x: 0.9587, y: 0.9957), CGPoint(x: 1.0187, y: 0.9616), CGPoint(x: 0.9833, y: 0.9931), CGPoint(x: 0.8683, y: 0.9744), CGPoint(x: 0.9341, y: 0.9983), CGPoint(x: 0.8729, y: 1.0112), CGPoint(x: 0.7194, y: 0.9487), CGPoint(x: 0.8637, y: 0.9377), CGPoint(x: 0.7802, y: 0.9487), CGPoint(x: 0.1384, y: 0.9487), CGPoint(x: 0.6587, y: 0.9487), CGPoint(x: 0.1384, y: 0.9487), CGPoint(x: 0.1163, y: 0.5443), CGPoint(x: 0.1384, y: 0.9487), CGPoint(x: 0.1889, y: 0.7568), CGPoint(x: 0.0, y: 0.0957), CGPoint(x: 0.0437, y: 0.3319), CGPoint(x: 0.0, y: 0.0957)]
    
    var body: some View {
        CatShape(points: isAnimated ? points2 : points1)
            .aspectRatio(495.48 / 383.45, contentMode: .fit)
            .animation(.easeInOut(duration: 2), value: isAnimated)
            .onTapGesture {
                if meow == 0 {
                    meow = .random(in: 1...2)
                }
                withAnimation {
                    meow = 0
                }
            }
            .overlay {
                if meow != 0 {
                    GeometryReader { geometry in
                        Text("meow")
                            .foregroundColor(.white)
                            .offset(x: geometry.size.width / CGFloat(2 * meow) - geometry.size.width / 16, y: geometry.size.height / CGFloat(4 * meow) - geometry.size.height / 4)
                    }
                }
            }
            .onReceive(timer) { input in
                if Calendar.current.component(.second, from: input) % 4 == 0 {
                    withAnimation {
                        isAnimated.toggle()
                    }
                }
            }
    }
}

struct CatShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 41 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addLine(to: CGPoint(x: points[1].x * width, y: points[1].y * height))
        path.addLine(to: CGPoint(x: points[2].x * width, y: points[2].y * height))
        path.addLine(to: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        path.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        path.addCurve(to: CGPoint(x: points[13].x * width, y: points[13].y * height), control1: CGPoint(x: points[14].x * width, y: points[14].y * height), control2: CGPoint(x: points[15].x * width, y: points[15].y * height))
        path.addCurve(to: CGPoint(x: points[16].x * width, y: points[16].y * height), control1: CGPoint(x: points[17].x * width, y: points[17].y * height), control2: CGPoint(x: points[18].x * width, y: points[18].y * height))
        path.addLine(to: CGPoint(x: points[19].x * width, y: points[19].y * height))
        path.addCurve(to: CGPoint(x: points[20].x * width, y: points[20].y * height), control1: CGPoint(x: points[21].x * width, y: points[21].y * height), control2: CGPoint(x: points[22].x * width, y: points[22].y * height))
        path.addCurve(to: CGPoint(x: points[23].x * width, y: points[23].y * height), control1: CGPoint(x: points[24].x * width, y: points[24].y * height), control2: CGPoint(x: points[25].x * width, y: points[25].y * height))
        path.addCurve(to: CGPoint(x: points[26].x * width, y: points[26].y * height), control1: CGPoint(x: points[27].x * width, y: points[27].y * height), control2: CGPoint(x: points[28].x * width, y: points[28].y * height))
        path.addCurve(to: CGPoint(x: points[29].x * width, y: points[29].y * height), control1: CGPoint(x: points[30].x * width, y: points[30].y * height), control2: CGPoint(x: points[31].x * width, y: points[31].y * height))
        path.addCurve(to: CGPoint(x: points[32].x * width, y: points[32].y * height), control1: CGPoint(x: points[33].x * width, y: points[33].y * height), control2: CGPoint(x: points[34].x * width, y: points[34].y * height))
        path.addCurve(to: CGPoint(x: points[35].x * width, y: points[35].y * height), control1: CGPoint(x: points[36].x * width, y: points[36].y * height), control2: CGPoint(x: points[37].x * width, y: points[37].y * height))
        path.addCurve(to: CGPoint(x: points[38].x * width, y: points[38].y * height), control1: CGPoint(x: points[39].x * width, y: points[39].y * height), control2: CGPoint(x: points[40].x * width, y: points[40].y * height))
        path.closeSubpath()
        return path
    }
}

// Simplify operations on CGPoints
extension CGPoint {
    static func *<N>(lhs: CGPoint, rhs: N) -> CGPoint where N: BinaryInteger {
        return CGPoint(x: lhs.x * CGFloat(rhs), y: lhs.y * CGFloat(rhs))
    }
    
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

// Animatable array of points
struct AnimatablePoints: VectorArithmetic {
    var points: [CGPoint]
    
    static func - (lhs: AnimatablePoints, rhs: AnimatablePoints) -> AnimatablePoints {
        return AnimatablePoints(points: zip(lhs.points, rhs.points).map(-))
    }
    
    static func + (lhs: AnimatablePoints, rhs: AnimatablePoints) -> AnimatablePoints {
        return AnimatablePoints(points: zip(lhs.points, rhs.points).map(+))
    }
    
    mutating func scale(by rhs: Double) {
        self.points = points.map { CGPoint(x: $0.x * rhs, y: $0.y * rhs) }
    }
    
    var magnitudeSquared: Double {
        self.points.map { pow($0.x, 2) + pow($0.y, 2) }.reduce(0, +)
    }
    
    static var zero: AnimatablePoints {
        AnimatablePoints(points: [.zero])
    }
}
