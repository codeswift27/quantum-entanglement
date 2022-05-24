//
//  GiftLid.swift
//  
//
//  Created by Lexline Johnson on 14/04/2022.
//

import SwiftUI

// 🎁
struct GiftLid: View {
    var isAnimated: Bool
    
    var bowPoints1 = [CGPoint(x: 0.3332, y: 0.2003), CGPoint(x: 0.2473, y: 0.0429), CGPoint(x: 0.3332, y: 0.2003), CGPoint(x: 0.3215, y: 0.0795), CGPoint(x: 0.1351, y: 0.0989), CGPoint(x: 0.173, y: 0.0063), CGPoint(x: 0.1377, y: 0.0469), CGPoint(x: 0.2194, y: 0.2003), CGPoint(x: 0.1176, y: 0.1653), CGPoint(x: 0.1697, y: 0.2003), CGPoint(x: 0.3332, y: 0.2003), CGPoint(x: 0.4191, y: 0.0429), CGPoint(x: 0.3332, y: 0.2003), CGPoint(x: 0.3448, y: 0.0795), CGPoint(x: 0.5312, y: 0.0989), CGPoint(x: 0.4933, y: 0.0063), CGPoint(x: 0.5286, y: 0.0469), CGPoint(x: 0.4469, y: 0.2003), CGPoint(x: 0.5338, y: 0.1509), CGPoint(x: 0.4966, y: 0.2003)]
    var bowPoints2 = [CGPoint(x: 0.8038, y: 0.5292), CGPoint(x: 0.8893, y: 0.3714), CGPoint(x: 0.8038, y: 0.5292), CGPoint(x: 0.888, y: 0.4737), CGPoint(x: 0.8101, y: 0.2549), CGPoint(x: 0.8906, y: 0.269), CGPoint(x: 0.849, y: 0.2402), CGPoint(x: 0.7649, y: 0.3915), CGPoint(x: 0.7713, y: 0.2695), CGPoint(x: 0.7479, y: 0.3314), CGPoint(x: 0.8038, y: 0.5292), CGPoint(x: 0.9481, y: 0.5794), CGPoint(x: 0.8038, y: 0.5292), CGPoint(x: 0.896, y: 0.5021), CGPoint(x: 0.9456, y: 0.7342), CGPoint(x: 1.0002, y: 0.6567), CGPoint(x: 0.9826, y: 0.7133), CGPoint(x: 0.8428, y: 0.6669), CGPoint(x: 0.9085, y: 0.7551), CGPoint(x: 0.8598, y: 0.7271)]
    var ribbonPoints1 = [CGPoint(x: 0.2876, y: 0.2198), CGPoint(x: 0.381, y: 0.2198), CGPoint(x: 0.381, y: 0.4171), CGPoint(x: 0.2876, y: 0.4171)]
    var ribbonPoints2 = [CGPoint(x: 0.774, y: 0.4808), CGPoint(x: 0.8059, y: 0.5938), CGPoint(x: 0.6621, y: 0.6612), CGPoint(x: 0.6301, y: 0.5482)]
    var lidPoints1 = [CGPoint(x: 0.0299, y: 0.2198), CGPoint(x: 0.6387, y: 0.2198), CGPoint(x: 0.6686, y: 0.2583), CGPoint(x: 0.6552, y: 0.2198), CGPoint(x: 0.6686, y: 0.2371), CGPoint(x: 0.6686, y: 0.3786), CGPoint(x: 0.6387, y: 0.4171), CGPoint(x: 0.6686, y: 0.3998), CGPoint(x: 0.6552, y: 0.4171), CGPoint(x: 0.0299, y: 0.4171), CGPoint(x: 0.0, y: 0.3786), CGPoint(x: 0.0134, y: 0.4171), CGPoint(x: 0.0, y: 0.3998), CGPoint(x: 0.0, y: 0.2583), CGPoint(x: 0.0299, y: 0.2198), CGPoint(x: 0.0, y: 0.2371), CGPoint(x: 0.0134, y: 0.2198)]
    var lidPoints2 = [CGPoint(x: 0.6859, y: 0.1688), CGPoint(x: 0.8941, y: 0.9057), CGPoint(x: 0.8762, y: 0.955), CGPoint(x: 0.8997, y: 0.9256), CGPoint(x: 0.8917, y: 0.9477), CGPoint(x: 0.7885, y: 0.9961), CGPoint(x: 0.7502, y: 0.9731), CGPoint(x: 0.773, y: 1.0034), CGPoint(x: 0.7558, y: 0.9931), CGPoint(x: 0.542, y: 0.2363), CGPoint(x: 0.5598, y: 0.187), CGPoint(x: 0.5363, y: 0.2163), CGPoint(x: 0.5443, y: 0.1942), CGPoint(x: 0.6476, y: 0.1459), CGPoint(x: 0.6859, y: 0.1688), CGPoint(x: 0.6631, y: 0.1386), CGPoint(x: 0.6802, y: 0.1489)]
    
    var body: some View {
        ZStack {
            LidShape(points: isAnimated ? lidPoints2 : lidPoints1)
                .foregroundColor(Color(red: 255 / 255, green: 215 / 255, blue: 82 / 255, opacity: 1))
            RibbonShape(points: isAnimated ? ribbonPoints2 : ribbonPoints1)
                .foregroundColor(Color(red: 255 / 255, green: 54 / 255, blue: 54 / 255, opacity: 1))
            BowShape(points: isAnimated ? bowPoints2 : bowPoints1)
                .stroke(lineWidth: 8)
                .foregroundColor(Color(red: 255 / 255, green: 54 / 255, blue: 54 / 255, opacity: 1))
        }
        .aspectRatio(267.74 / 207.88, contentMode: .fit)
        .animation(.easeOut(duration: 0.8), value: isAnimated)
    }
}

struct BowShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 20 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addCurve(to: CGPoint(x: points[1].x * width, y: points[1].y * height), control1: CGPoint(x: points[2].x * width, y: points[2].y * height), control2: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        path.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.closeSubpath()
        
        var bow1 = Path()
        bow1.move(to: CGPoint(x: points[10].x * width, y: points[10].y * height))
        bow1.addCurve(to: CGPoint(x: points[11].x * width, y: points[11].y * height), control1: CGPoint(x: points[12].x * width, y: points[12].y * height), control2: CGPoint(x: points[13].x * width, y: points[13].y * height))
        bow1.addCurve(to: CGPoint(x: points[14].x * width, y: points[14].y * height), control1: CGPoint(x: points[15].x * width, y: points[15].y * height), control2: CGPoint(x: points[16].x * width, y: points[16].y * height))
        bow1.addCurve(to: CGPoint(x: points[17].x * width, y: points[17].y * height), control1: CGPoint(x: points[18].x * width, y: points[18].y * height), control2: CGPoint(x: points[19].x * width, y: points[19].y * height))
        bow1.closeSubpath()
        
        path.addPath(bow1)
        return path
    }
}

struct RibbonShape: Shape {
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

struct LidShape: Shape {
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
