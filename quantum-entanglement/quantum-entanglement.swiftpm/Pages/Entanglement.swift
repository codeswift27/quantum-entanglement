//
//  Entanglement.swift
//  Quantum Entanglement
//
//  Created by Lexline Johnson on 11/04/2022.
//

import SwiftUI

struct Entanglement: View {
    @State var chocolate: Bool = false
    @State var opened: Int?
    @State var gift: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let repeatTimer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Classical Physics vs. Quantum Physics")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    Text("""
Classical physics shows us that all objects have definite properties and states that generally remain constant unless acted upon by other forces. The ground won’t suddenly disappear and your work won’t do itself (sadly). This holds true even for objects we don’t observe. We know, for example, the parts inside of our bodies and how they function, even though we can’t see them!

Quantum physics, however, is much different. In the quantum world, particles’ properties and states are unpredictable and the closest we can get to measuring them is by creating probabilities. Quantum particles also naturally exist in a combination of possible states that only become definitive when we observe them. To put this into a macroscopic perspective, it would be as though the our body parts could be anything—maybe they all turned into chocolate!—until we get an x-ray.
""")
                        .font(.body)
                        .padding(.bottom)
                    HStack {
                        Text("Entanglement")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    Text("""
Quantum particles can also become entangled. When this happens, the measured properties of one particle determines the measured properties of the other. For example, say you have two gift boxes 🎁. The boxes contain a scarf and a bar of chocolate, however, you don’t know which contains which! You open one of the boxes and find the scarf. Since the boxes only contain a scarf and a bar of chocolate, you can conclude that the other box must contain the bar of chocolate (yum!).

This is almost how entanglement works, except now imagine that you close the boxes again and the contents of each box are, once again, unknown. In fact, they’re not just unknown, they’re undefined. While they are closed, each box simultaneously has the possibility of containing the scarf and the bar of chocolate. If you open the box again, it might contain the bar of chocolate this time!

Does this sound confusing? That’s because it is! Quantum particles behave so much differently from macroscopic objects that it confuses lots of physicists. But at least you can rest assured that you chocolate isn’t going anywhere when you’re not looking!
""")
                        .font(.body)
                    Spacer()
                }
                .padding()
            }
            TabView {
                ZStack {
                    Cat(timer: timer)
                        .foregroundColor(.black)
                    Skeleton(timer: timer)
                }
                .padding(48)
                GeometryReader { geometry in
                    ZStack {
                        Cat(timer: timer)
                            .foregroundColor(.black)
                        Group {
                            if chocolate {
                                Image("chocolate")
                                    .padding(.trailing, geometry.size.width / 2)
                            }
                            Skeleton(timer: timer, strokeStyle: StrokeStyle(lineWidth: 3, lineCap: .round ,dash: [12]))
                                .opacity(chocolate ? 0 : 1)
                            Image(systemName: "questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 16)
                                .padding(.trailing, geometry.size.width / 2)
                            ZStack {
                                Color.black
                                Cat(timer: timer)
                                    .foregroundColor(Color(red: 48 / 255, green: 75 / 255, blue: 90 / 255, opacity: 1))
                                Skeleton(timer: timer)
                            }
                            .mask(XRay(timer: repeatTimer)
                                .padding(.leading, geometry.size.width / 2.95)
                                .padding(.top, geometry.size.width / 2.95)
                            )
                            XRay(timer: repeatTimer, strokeStyle: StrokeStyle(lineWidth: geometry.size.width / 54))
                                .padding(.leading, geometry.size.width / 2.95)
                                .padding(.top, geometry.size.width / 2.95)
                        }
                        .allowsHitTesting(false)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(48)
                GeometryReader { geometry in
                    VStack(spacing: 0) {
                        HStack {
                            ZStack {
                                Image("gift_box")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    // Open gift on long press
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { point in
                                                if opened == nil {
                                                    withAnimation {
                                                        gift = .random(in: 0...1)
                                                        opened = 0
                                                    }
                                                }
                                            }
                                            .onEnded { _ in
                                                withAnimation {
                                                    opened = nil
                                                }
                                            }
                                    )
                                    .padding(.trailing, geometry.size.width / 6.15)
                                    .padding(geometry.size.width / 40)
                                GiftLid(isAnimated: opened == 0)
                                    .padding(.bottom, geometry.size.width / 9.4)
                                Group {
                                    if opened != 0 {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color(red: 44 / 255, green: 44 / 255, blue: 44 / 255, opacity: 1))
                                            .aspectRatio(1, contentMode: .fit)
                                            .frame(width: geometry.size.width / 4)
                                        Image(gift == 0 ? "chocolate" : "scarf")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width / 5)
                                    } else {
                                        Image(gift == 0 ? "chocolate" : "scarf")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width / 5)
                                            .animation(.easeOut(duration: 0.6))
                                            .transition(.move(edge: .bottom))
                                            
                                            .zIndex(-1)
                                            .offset(x: 0, y: -geometry.size.width / 4)
                                    }
                                }
                                .padding(.trailing, geometry.size.width / 6.15)
                                .allowsHitTesting(false)
                            }
                            ZStack {
                                Image("gift_box")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    // Open gift on long press
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { point in
                                                if opened == nil {
                                                    withAnimation {
                                                        gift = .random(in: 0...1)
                                                        opened = 1
                                                    }
                                                }
                                            }
                                            .onEnded { _ in
                                                withAnimation {
                                                    opened = nil
                                                }
                                            }
                                    )
                                    .padding(.trailing, geometry.size.width / 6.15)
                                    .padding(geometry.size.width / 40)
                                GiftLid(isAnimated: opened == 1)
                                    .padding(.bottom, geometry.size.width / 9.4)
                                Group {
                                    if opened != 1 {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color(red: 44 / 255, green: 44 / 255, blue: 44 / 255, opacity: 1))
                                            .aspectRatio(1, contentMode: .fit)
                                            .frame(width: geometry.size.width / 4)
                                        Image(gift == 1 ? "chocolate" : "scarf")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width / 5)
                                    } else {
                                        Image(gift == 1 ? "chocolate" : "scarf")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width / 5)
                                            .transition(.move(edge: .bottom))
                                            .animation(.easeOut(duration: 0.6))
                                            .zIndex(-1)
                                            .offset(x: 0, y: -geometry.size.width / 4)
                                    }
                                }
                                .padding(.trailing, geometry.size.width / 6.15)
                                .allowsHitTesting(false)
                            }
                        }
                        HStack {
                            Text("press and hold on a box to open it")
                            Spacer()
                        }
                        .padding(.top, -10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(48)
            }
            .tabViewStyle(.page)
        }
        .background(Color(red: 55 / 255, green: 56 / 255, blue: 87 / 255))
        .navigationTitle("What is Entanglement?")
        .onReceive(timer) { _ in
            chocolate.toggle()
        }
        .onReceive(repeatTimer) { _ in
            // If giftbox is closed, gift is undefined (keeps changing in the visual)
            if opened == nil {
                gift = .random(in: 0...1)
            }
        }
    }
}

struct Entanglement_Previews: PreviewProvider {
    static var previews: some View {
        Entanglement()
    }
}
