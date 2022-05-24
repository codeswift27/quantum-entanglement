//
//  SleepyCat.swift
//  
//
//  Created by Lexline Johnson on 19/04/2022.
//

import SwiftUI
import Combine

// 💤
struct SleepyCat: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    var halfSeconds: Int
    var isAwake: Bool = false
    
    @State var isAnimated: Bool = false
    var points1 = [CGPoint(x: 0.0653, y: 0.1979), CGPoint(x: 0.1574, y: 0.3488), CGPoint(x: 0.1301, y: 0.3112), CGPoint(x: 0.1574, y: 0.3488), CGPoint(x: -0.0114, y: 0.6128), CGPoint(x: 0.7068, y: 0.1033), CGPoint(x: 0.2718, y: 0.0095), CGPoint(x: 0.57, y: 0.0237), CGPoint(x: 0.9642, y: 0.4826), CGPoint(x: 0.8436, y: 0.1829), CGPoint(x: 0.9188, y: 0.313), CGPoint(x: 0.9913, y: 0.9838), CGPoint(x: 1.0096, y: 0.6522), CGPoint(x: 1.0032, y: 0.8347), CGPoint(x: 0.364, y: 0.9538), CGPoint(x: 0.9913, y: 0.9838), CGPoint(x: 0.5246, y: 1.0356), CGPoint(x: 0.8608, y: 0.9704), CGPoint(x: 0.2787, y: 0.9104), CGPoint(x: 0.8608, y: 0.9704), CGPoint(x: 0.0974, y: 0.9704), CGPoint(x: 0.0021, y: 0.6772), CGPoint(x: 0.0974, y: 0.9704), CGPoint(x: 0.018, y: 0.9283), CGPoint(x: 0.0653, y: 0.1979), CGPoint(x: -0.0137, y: 0.4261), CGPoint(x: 0.0653, y: 0.1979)]
    var points2 = [CGPoint(x: 0.0653, y: 0.1979), CGPoint(x: 0.1574, y: 0.3488), CGPoint(x: 0.1301, y: 0.3112), CGPoint(x: 0.1574, y: 0.3488), CGPoint(x: 0.0077, y: 0.6604), CGPoint(x: 0.7068, y: 0.0436), CGPoint(x: 0.2526, y: -0.038), CGPoint(x: 0.57, y: -0.0358), CGPoint(x: 0.9642, y: 0.4229), CGPoint(x: 0.8436, y: 0.1232), CGPoint(x: 0.9188, y: 0.2533), CGPoint(x: 0.9913, y: 0.9838), CGPoint(x: 1.0096, y: 0.5926), CGPoint(x: 1.0032, y: 0.8347), CGPoint(x: 0.364, y: 0.9538), CGPoint(x: 0.9913, y: 0.9838), CGPoint(x: 0.5246, y: 1.0356), CGPoint(x: 0.8608, y: 0.9704), CGPoint(x: 0.2787, y: 0.9104), CGPoint(x: 0.8608, y: 0.9704), CGPoint(x: 0.0974, y: 0.9704), CGPoint(x: 0.0021, y: 0.6772), CGPoint(x: 0.0974, y: 0.9704), CGPoint(x: 0.018, y: 0.9283), CGPoint(x: 0.0653, y: 0.1979), CGPoint(x: -0.0137, y: 0.4261), CGPoint(x: 0.0653, y: 0.1979)]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                SleepyCatShape(points: isAnimated ? points2 : points1)
                    .foregroundColor(.black)
                    .animation(.easeInOut(duration: 3), value: isAnimated)
                Group {
                    if isAwake {
                        Image("sleepy_cat_outline_awake")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image("sleepy_cat_outline")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding(.leading, geometry.size.width / 20)
                .padding(.top, geometry.size.height / 5.2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .aspectRatio(215.6 / 167.59, contentMode: .fit)
        .onReceive(timer) { input in
            if isAwake {
                isAnimated = false
                return
            }
            if halfSeconds % 7 == 0 {
                withAnimation {
                    isAnimated.toggle()
                }
            }
        }
    }
}

struct SleepyCatShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 27 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addLine(to: CGPoint(x: points[1].x * width, y: points[1].y * height))
        path.addCurve(to: CGPoint(x: points[2].x * width, y: points[2].y * height), control1: CGPoint(x: points[3].x * width, y: points[3].y * height), control2: CGPoint(x: points[4].x * width, y: points[4].y * height))
        path.addCurve(to: CGPoint(x: points[5].x * width, y: points[5].y * height), control1: CGPoint(x: points[6].x * width, y: points[6].y * height), control2: CGPoint(x: points[7].x * width, y: points[7].y * height))
        path.addCurve(to: CGPoint(x: points[8].x * width, y: points[8].y * height), control1: CGPoint(x: points[9].x * width, y: points[9].y * height), control2: CGPoint(x: points[10].x * width, y: points[10].y * height))
        path.addCurve(to: CGPoint(x: points[11].x * width, y: points[11].y * height), control1: CGPoint(x: points[12].x * width, y: points[12].y * height), control2: CGPoint(x: points[13].x * width, y: points[13].y * height))
        path.addCurve(to: CGPoint(x: points[14].x * width, y: points[14].y * height), control1: CGPoint(x: points[15].x * width, y: points[15].y * height), control2: CGPoint(x: points[16].x * width, y: points[16].y * height))
        path.addCurve(to: CGPoint(x: points[17].x * width, y: points[17].y * height), control1: CGPoint(x: points[18].x * width, y: points[18].y * height), control2: CGPoint(x: points[19].x * width, y: points[19].y * height))
        path.addLine(to: CGPoint(x: points[20].x * width, y: points[20].y * height))
        path.addCurve(to: CGPoint(x: points[21].x * width, y: points[21].y * height), control1: CGPoint(x: points[22].x * width, y: points[22].y * height), control2: CGPoint(x: points[23].x * width, y: points[23].y * height))
        path.addCurve(to: CGPoint(x: points[24].x * width, y: points[24].y * height), control1: CGPoint(x: points[25].x * width, y: points[25].y * height), control2: CGPoint(x: points[26].x * width, y: points[26].y * height))
        path.closeSubpath()
        return path
    }
}
