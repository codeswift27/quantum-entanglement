//
//  Introduction.swift
//  Quantum Entanglement
//
//  Created by Lexline Johnson on 17/04/2022.
//

import SwiftUI

struct Introduction: View {
    @State var chocolate: Bool = false
    @State var halfSeconds: Int = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Night(timer: timer, halfSeconds: halfSeconds, chocolate: chocolate)
                if halfSeconds >= 4 {
                    Text("It’s just another normal day in a normal world...")
                        .padding(.bottom, geometry.size.height / 1.6)
                }
                if halfSeconds >= 10 {
                    Text("...But what if things aren’t always what they seem?")
                        .padding(.bottom, geometry.size.height / 2)
                }
            }
            .frame(maxWidth: geometry.size.width, maxHeight: .infinity)
        }
        .background(chocolate ? Color(red: 57 / 255, green: 33 / 255, blue: 33 / 255, opacity: 1) : Color(red: 33 / 255, green: 33 / 255, blue: 57 / 255, opacity: 1))
        .onReceive(timer) { input in
//            if chocolate {
//                return
//            }
            if halfSeconds == 14 && !chocolate {
                withAnimation {
                    print("chocolate is TRUE")
                    chocolate = true
                }
            }
            withAnimation {
                halfSeconds += 1
            }
        }
        .onAppear {
            // Reset half-second count on appear
            halfSeconds = 0
        }
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
