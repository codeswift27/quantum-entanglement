//
//  Decoherence.swift
//  Quantum Entanglement
//
//  Created by Lexline Johnson on 11/04/2022.
//

import SwiftUI

struct Decoherence: View {
    @State var observed: Bool = false
    @State var spin: Int = 0
    @State var scale = 1.0
    
    let repeatTimer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Schrödinger’s Kittens")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    Text("""
As far as we know, entanglement only exists the quantum world. The macroscopic world, on the other hand, behaves in a way we consider relatively normal. But why is that? What makes large things so different from small things? To solve this puzzle, physicists decided to scale up quantum states.

Schrödinger’s kittens are relatively large objects that still exhibit quantum behavior. One type of “kitten” is called Bose-Einstein condensate (BEC). BEC consists of groups of atoms cooled to nearly zero degrees Kelvin, meaning they contain almost no kinetic energy. Instead of forming lattice solids, however, these ultracold atoms clump together and exist in the same quantum states, as though they were a single atom. As a result, these nearly macroscopic substances also obey quantum laws and can become entangled like other quantum particles. Physicists have created and entangled Bose-Einstein condensate clouds containing up to ten-thousand ultracold atoms! They have also entangled silicon microbeams and microscopic metal sheets.
""")
                        .font(.body)
                        .padding(.bottom)
                    HStack {
                        Text("Decoherence")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    Text("""
So what makes Schrödinger’s kittens different from other macroscopic objects? The answer lies a in a simple process called decoherence. As particles interact with their environment, they become more entangled with it and thus it becomes increasingly impossible to measure all of their states. As a result, the particles are forced into constant states and lose their quantum properties. Unlike regular macroscopic objects, Schrödinger’s kittens are created in controlled, ultracold environments to prevent decoherence and allow particles to retain their quantum properties. However, decoherence still affects most macroscopic objects so, fortunately, your cat will never be both dead and alive!
""")
                        .font(.body)
                    Spacer()
                }
                .padding()
            }
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    HStack(spacing: geometry.size.width / 16) {
                        Image("kitten_cloud_2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale)
                            .padding(.trailing, geometry.size.width / 14)
                            .padding(.bottom, geometry.size.width / 6)
                        Image("kitten_cloud")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2).repeatForever()) {
                            scale = 1.05
                        }
                    }
                    ZStack {
                        Image("bubble_2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        HStack(spacing: 0) {
                            Circle()
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundColor(spin == 0 ? Color(red: 255 / 255, green: 54 / 255, blue: 54 / 255, opacity: 1) : Color(red: 54 / 255, green: 154 / 255, blue: 255 / 255, opacity: 1))
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { point in
                                            if !observed {
                                                spin = .random(in: 0...1)
                                                observed = true
                                            }
                                        }
                                        .onEnded { _ in
                                            observed = false
                                        }
                                )
                                .padding(geometry.size.width / 7)
                                .overlay {
                                    if spin == 0 {
                                        VStack(spacing: geometry.size.width / 4) {
                                            Image("arrow_up")
                                            Text(observed ? "spin up" : "")
                                                .padding(.top, -10)
                                        }
                                    } else {
                                        VStack(spacing: geometry.size.width / 4) {
                                            Text(observed ? "spin down" : "")
                                                .padding(.bottom, -10)
                                            Image("arrow_up")
                                                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                                        }
                                    }
                                }
                            Circle()
                                .aspectRatio(1, contentMode: .fit)  // Limit space that the Shape takes up
                                .foregroundColor(spin == 1 ? Color(red: 255 / 255, green: 54 / 255, blue: 54 / 255, opacity: 1) : Color(red: 54 / 255, green: 154 / 255, blue: 255 / 255, opacity: 1))
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { point in
                                            if !observed {
                                                spin = .random(in: 0...1)
                                                observed = true
                                            }
                                        }
                                        .onEnded { _ in
                                            observed = false
                                        }
                                )
                                .padding(geometry.size.width / 7)
                                .overlay {
                                    if spin == 1 {
                                        VStack(spacing: geometry.size.width / 4) {
                                            Image("arrow_up")
                                            Text(observed ? "spin up" : "")
                                                .padding(.top, -10)
                                        }
                                    } else {
                                        VStack(spacing: geometry.size.width / 4) {
                                            Text(observed ? "spin down" : "")
                                                .padding(.bottom, -10)
                                            Image("arrow_up")
                                                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                                        }
                                    }
                                }
                        }
                        .padding(.top, geometry.size.width / 20)
                    }
                    .padding(.bottom, geometry.size.width / 16)
                    .padding(.horizontal, geometry.size.width / 16)
                    Text("press and hold on an entangled particle to measure its spin")
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(48)
        }
        .background(Color(red: 55 / 255, green: 56 / 255, blue: 87 / 255))
        .navigationTitle("Decoherence")
        .onReceive(repeatTimer) { _ in
            if !observed {
                spin = .random(in: 0...1)
            }
        }
    }
}

struct Decoherence_Previews: PreviewProvider {
    static var previews: some View {
        Decoherence()
    }
}
