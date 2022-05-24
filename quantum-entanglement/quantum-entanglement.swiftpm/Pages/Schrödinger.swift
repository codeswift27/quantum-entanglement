//
//  Schrödinger.swift
//  Quantum Entanglement
//
//  Created by Lexline Johnson on 11/04/2022.
//

import SwiftUI

struct Schrödinger: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Schrödinger’s Thought Experiment")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    Text("""
One well-known physicist, Erwin Schrödinger, questioned the practical applications of entanglement. He demonstrated this through his famous thought experiment, known as Schrödinger’s Cat. Schrödinger proposed a room containing a vial of lethal poison and a cat. According to his experiment, the vial of poison was linked to a quantum particle that, in one state, would release the poison, and in the other, would not. Thus, depending on the particle’s state, the hypothetical cat would either die or live. However, entanglement theory suggests that quantum particles, before observed, exist in a state of superposition, or combination of possible states. This would mean that, until it is observed, the cat would be in limbo state of being both dead and alive!

This, of course, is not possible and raises questions about validity of entanglement. How can something that seems absurd in the macroscopic world be perfectly normal in the quantum world?

P.S. tap to pet the cute cat
""")
                        .font(.body)
                        .padding(.bottom)
                    Spacer()
                }
                .padding()
            }
            GeometryReader { geometry in
                ZStack {
                    VStack(spacing: geometry.size.width / 60) {
                        ZStack {
                            Cat(timer: timer)
                                .foregroundColor(.black)
                            Eyes(timer: timer)
                        }
                        .padding(.trailing, geometry.size.width / 10)
                        Poison(timer: timer)
                            .padding(.leading, geometry.size.width / 5)
                    }
                    Image("beaker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotation3DEffect(.degrees(-106), axis: (x: 0, y: 0, z: 1))
                        .frame(width: geometry.size.width / 8)
                        .padding(.leading, geometry.size.width / 1.6)
                        .padding(.top, geometry.size.width / 1.7)
                    Image("fishbone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 6)
                        .padding(.trailing, geometry.size.width / 14)
                        .padding(.top, geometry.size.width / 1.25)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(48)
        }
        .background(Color(red: 55 / 255, green: 56 / 255, blue: 87 / 255))
        .navigationTitle("Schrödinger’s Cat")
    }
}

struct Schrödinger_Previews: PreviewProvider {
    static var previews: some View {
        Schrödinger()
    }
}
