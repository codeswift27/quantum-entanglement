//
//  Conclusion.swift
//  Quantum Entanglement
//
//  Created by Lexline Johnson on 17/04/2022.
//

import SwiftUI

struct Conclusion: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Future of Entanglement")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    Text("""
Due to decoherence, human teleportation still appears to be unfeasible. However, entanglement could be used as a form of data encryption in the near future. Because it does not actually transmit information, data cannot be intercepted, and otherwise attempting to access this information would likely break the entanglement, deleting the information instead of leaking it.

Science has come a long a way, yet entanglement is still just one of the many strange and new forces in the quantum world waiting to be discovered! Who knows, maybe you'll make the next scientific breakthrough!
""")
                        .font(.body)
                        .padding(.bottom)
                    Spacer()
                }
                .padding()
            }
            GeometryReader { geometry in
                ZStack {
                    Image("computer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, geometry.size.width / 5)
                        .padding(.bottom, geometry.size.width / 6)  // Using width to change padding with respect to image size
                    PixelCat()
                        .padding(geometry.size.width / 3.2)
                        .padding(.trailing, geometry.size.width / 5)
                        .padding(.bottom, geometry.size.width / 2.4)
                    Cat(timer: timer)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .foregroundColor(.black)
                        .padding(.leading, geometry.size.width / 10)
                        .padding(.top, geometry.size.width / 6)
                        .allowsHitTesting(false)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(48)
        }
        .background(Color(red: 55 / 255, green: 56 / 255, blue: 87 / 255))
        .navigationTitle("Conclusion")
    }
}

struct Conclusion_Previews: PreviewProvider {
    static var previews: some View {
        Conclusion()
    }
}
