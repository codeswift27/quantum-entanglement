//
//  PixelCat.swift
//  
//
//  Created by Lexline Johnson on 17/04/2022.
//

import SwiftUI

//🐱
struct PixelCat: View {
    @State var pixels: Int = 0
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Image("pixel_cat")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(PixelCatMask(pixels: pixels)
                .aspectRatio(85 / 100, contentMode: .fit)
            )
            .onReceive(timer) { _ in
                pixels = (pixels + 1) % 340
            }
    }
}

struct PixelCatMask: Shape {
    var pixels: Int
    
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        for row in 0..<Int(Double(pixels) / 17 + 0.99) {
            let pixelsLeft = pixels - row * 17
            for column in 0..<(pixelsLeft < 17 ? pixelsLeft : 17) {
                path.addPath(Rectangle().path(in: CGRect(x: (width / 17) * CGFloat(column), y: (height / 20) * CGFloat(row), width: width / 17, height: height / 20)))
            }
        }
        return path
    }
}
