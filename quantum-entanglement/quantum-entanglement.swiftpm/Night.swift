//
//  Night.swift
//  
//
//  Created by Lexline Johnson on 24/04/2022.
//

import SwiftUI
import Combine

// Cat is sleeping
struct Night: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    var halfSeconds: Int
    var chocolate: Bool = false
    
    @State var light: Bool = false
    @State var drip: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            // Everything's chocolate!
            if chocolate {
                ZStack {
                    Image("choco_night")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(alignment: .center)
                    Circle()
                        .foregroundColor(Color(red: 255 / 255, green: 230 / 255, blue: 212 / 255, opacity: 0.1))
                        .animation(.easeInOut(duration: 1.5), value: light)
                        .frame(width: light ? (geometry.size.height / 1.2) : (geometry.size.height / 1.3), height: light ? (geometry.size.height / 1.2) : (geometry.size.height / 1.3))
                        .offset(x: -geometry.size.height / 1.804, y: -geometry.size.height / 4.66)
                    Circle()
                        .foregroundColor(Color(red: 255 / 255, green: 230 / 255, blue: 212 / 255, opacity: 0.1))
                        .animation(.easeInOut(duration: 1.5), value: light)
                        .frame(width: light ? (geometry.size.height / 2.1) : (geometry.size.height / 2.3), height: light ? (geometry.size.height / 2.1) : (geometry.size.height / 2.3))
                        .offset(x: -geometry.size.height / 1.804, y: -geometry.size.height / 4.66)
                    SleepyCat(timer: timer, halfSeconds: halfSeconds, isAwake: true)
                        .frame(width: geometry.size.height / 3.6)
                        .offset(x: -geometry.size.height / 20, y: geometry.size.height / 6)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 255 / 255, green: 230 / 255, blue: 212 / 255, opacity: 1))
                        .frame(width: geometry.size.height / 140, height: geometry.size.height / 24)
                        .offset(x: -geometry.size.height / 2.095, y: -geometry.size.height / 8.8)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 255 / 255, green: 230 / 255, blue: 212 / 255, opacity: 1))
                        .frame(width: geometry.size.height / 20, height: geometry.size.height / 140)
                        .offset(x: -geometry.size.height / 2.095, y: geometry.size.height / 3.31)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 255 / 255, green: 230 / 255, blue: 212 / 255, opacity: 1))
                        .frame(width: geometry.size.height / 140, height: geometry.size.height / 24)
                        .offset(x: -geometry.size.height / 2.095, y:  drip ? geometry.size.height / 3 : -geometry.size.height / 8.8)
                        .mask(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: geometry.size.height, height: geometry.size.height / 2.45)
                                .offset(x: -geometry.size.height / 2.095, y: geometry.size.height / 10)
                        )
                        .onAppear {
                            // Drippity-drop!
                            withAnimation(.easeIn(duration: 0.5).delay(3).repeatForever(autoreverses: false)) {
                                drip = true
                            }
                        }
                }
                .background(Color(red: 87 / 255, green: 55 / 255, blue: 55 / 255))
            } else {    // Normal view
                ZStack {
                    Image("night")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(alignment: .center)
                    Circle()
                        .foregroundColor(Color(red: 255 / 255, green: 245 / 255, blue: 211 / 255, opacity: 0.1))
                        .animation(.easeInOut(duration: 1.5), value: light)
                        .frame(width: light ? (geometry.size.height / 1.2) : (geometry.size.height / 1.3), height: light ? (geometry.size.height / 1.2) : (geometry.size.height / 1.3))
                        .offset(x: -geometry.size.height / 1.804, y: -geometry.size.height / 4.66)
                    Circle()
                        .foregroundColor(Color(red: 255 / 255, green: 245 / 255, blue: 211 / 255, opacity: 0.1))
                        .animation(.easeInOut(duration: 1.5), value: light)
                        .frame(width: light ? (geometry.size.height / 2.1) : (geometry.size.height / 2.3), height: light ? (geometry.size.height / 2.1) : (geometry.size.height / 2.3))
                        .offset(x: -geometry.size.height / 1.804, y: -geometry.size.height / 4.66)
                    SleepyCat(timer: timer, halfSeconds: halfSeconds)
                        .frame(width: geometry.size.height / 3.6)
                        .offset(x: -geometry.size.height / 20, y: geometry.size.height / 6)
                }
                .background(Color(red: 55 / 255, green: 56 / 255, blue: 87 / 255))
            }
        }
        .onReceive(timer) { input in
            if halfSeconds % 3 == 0 {
                withAnimation {
                    light.toggle()
                }
            }
        }
    }
}
