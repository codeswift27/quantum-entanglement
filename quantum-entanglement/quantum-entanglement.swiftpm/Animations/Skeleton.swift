//
//  Skeleton.swift
//  
//
//  Created by Lexline Johnson on 14/04/2022.
//

import SwiftUI
import Combine

// Yes, I know that skeletons don't include the heart. Carry on...
struct Skeleton: View {
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    var strokeStyle: StrokeStyle?
    
    @State var isAnimated: Bool = false
    var bonesPoints1 = [CGPoint(x: 0.2025, y: 0.1497), CGPoint(x: 0.2963, y: 0.2709), CGPoint(x: 0.2543, y: 0.1497), CGPoint(x: 0.3153, y: 0.2283), CGPoint(x: 0.2523, y: 0.3282), CGPoint(x: 0.2879, y: 0.2896), CGPoint(x: 0.2607, y: 0.3102), CGPoint(x: 0.2025, y: 0.3807), CGPoint(x: 0.2357, y: 0.3636), CGPoint(x: 0.2376, y: 0.3807), CGPoint(x: 0.1527, y: 0.3282), CGPoint(x: 0.1674, y: 0.3807), CGPoint(x: 0.1693, y: 0.3636), CGPoint(x: 0.1087, y: 0.2709), CGPoint(x: 0.1443, y: 0.3102), CGPoint(x: 0.1143, y: 0.2892), CGPoint(x: 0.2025, y: 0.1497), CGPoint(x: 0.0929, y: 0.2184), CGPoint(x: 0.1507, y: 0.1497), CGPoint(x: 0.1677, y: 0.6784), CGPoint(x: 0.2048, y: 0.7921), CGPoint(x: 0.1793, y: 0.6758), CGPoint(x: 0.1959, y: 0.7267), CGPoint(x: 0.2001, y: 0.9153), CGPoint(x: 0.2137, y: 0.8575), CGPoint(x: 0.2116, y: 0.9127), CGPoint(x: 0.163, y: 0.8016), CGPoint(x: 0.1885, y: 0.9179), CGPoint(x: 0.1719, y: 0.867), CGPoint(x: 0.1677, y: 0.6784), CGPoint(x: 0.1541, y: 0.7362), CGPoint(x: 0.1562, y: 0.681), CGPoint(x: 0.2627, y: 0.7242), CGPoint(x: 0.2839, y: 0.8198), CGPoint(x: 0.2744, y: 0.7242), CGPoint(x: 0.2839, y: 0.767), CGPoint(x: 0.2627, y: 0.9153), CGPoint(x: 0.2839, y: 0.8725), CGPoint(x: 0.2744, y: 0.9153), CGPoint(x: 0.2414, y: 0.8198), CGPoint(x: 0.2509, y: 0.9153), CGPoint(x: 0.2414, y: 0.8725), CGPoint(x: 0.2627, y: 0.7242), CGPoint(x: 0.2414, y: 0.767), CGPoint(x: 0.2509, y: 0.7242), CGPoint(x: 0.3688, y: 0.4136), CGPoint(x: 0.3811, y: 0.5392), CGPoint(x: 0.3756, y: 0.4136), CGPoint(x: 0.3811, y: 0.4698), CGPoint(x: 0.3688, y: 0.6648), CGPoint(x: 0.3811, y: 0.6085), CGPoint(x: 0.3756, y: 0.6648), CGPoint(x: 0.3564, y: 0.5392), CGPoint(x: 0.362, y: 0.6648), CGPoint(x: 0.3564, y: 0.6085), CGPoint(x: 0.3688, y: 0.4136), CGPoint(x: 0.3564, y: 0.4698), CGPoint(x: 0.362, y: 0.4136), CGPoint(x: 0.4497, y: 0.4347), CGPoint(x: 0.445, y: 0.5608), CGPoint(x: 0.4564, y: 0.4362), CGPoint(x: 0.4542, y: 0.4927), CGPoint(x: 0.416, y: 0.6814), CGPoint(x: 0.4357, y: 0.6289), CGPoint(x: 0.4227, y: 0.6829), CGPoint(x: 0.4208, y: 0.5553), CGPoint(x: 0.4094, y: 0.6799), CGPoint(x: 0.4115, y: 0.6234), CGPoint(x: 0.4497, y: 0.4347), CGPoint(x: 0.43, y: 0.4872), CGPoint(x: 0.443, y: 0.4332), CGPoint(x: 0.5131, y: 0.474), CGPoint(x: 0.4999, y: 0.5995), CGPoint(x: 0.5197, y: 0.4762), CGPoint(x: 0.5138, y: 0.5325), CGPoint(x: 0.4628, y: 0.7168), CGPoint(x: 0.486, y: 0.6666), CGPoint(x: 0.4693, y: 0.7191), CGPoint(x: 0.476, y: 0.5913), CGPoint(x: 0.4562, y: 0.7145), CGPoint(x: 0.4621, y: 0.6583), CGPoint(x: 0.5131, y: 0.474), CGPoint(x: 0.4899, y: 0.5242), CGPoint(x: 0.5066, y: 0.4717), CGPoint(x: 0.5717, y: 0.5301), CGPoint(x: 0.5516, y: 0.6547), CGPoint(x: 0.5782, y: 0.533), CGPoint(x: 0.5692, y: 0.5888), CGPoint(x: 0.5081, y: 0.7688), CGPoint(x: 0.534, y: 0.7206), CGPoint(x: 0.5146, y: 0.7717), CGPoint(x: 0.5282, y: 0.6443), CGPoint(x: 0.5016, y: 0.7659), CGPoint(x: 0.5106, y: 0.7102), CGPoint(x: 0.5717, y: 0.5301), CGPoint(x: 0.5457, y: 0.5784), CGPoint(x: 0.5652, y: 0.5272), CGPoint(x: 0.6227, y: 0.6243), CGPoint(x: 0.5938, y: 0.7288), CGPoint(x: 0.6288, y: 0.6285), CGPoint(x: 0.6159, y: 0.6753), CGPoint(x: 0.5429, y: 0.8181), CGPoint(x: 0.5718, y: 0.7823), CGPoint(x: 0.549, y: 0.8223), CGPoint(x: 0.5717, y: 0.7136), CGPoint(x: 0.5368, y: 0.8139), CGPoint(x: 0.5497, y: 0.7671), CGPoint(x: 0.6227, y: 0.6243), CGPoint(x: 0.5937, y: 0.6601), CGPoint(x: 0.6166, y: 0.6201), CGPoint(x: 0.4477, y: 0.8867), CGPoint(x: 0.5407, y: 0.8593), CGPoint(x: 0.4477, y: 0.8716), CGPoint(x: 0.4893, y: 0.8593), CGPoint(x: 0.6339, y: 0.8867), CGPoint(x: 0.5922, y: 0.8593), CGPoint(x: 0.6339, y: 0.8716), CGPoint(x: 0.5407, y: 0.9141), CGPoint(x: 0.6339, y: 0.9019), CGPoint(x: 0.5922, y: 0.9141), CGPoint(x: 0.4477, y: 0.8867), CGPoint(x: 0.4893, y: 0.9141), CGPoint(x: 0.4477, y: 0.9019)]
    var bonesPoints2 = [CGPoint(x: 0.1393, y: 0.1667), CGPoint(x: 0.2595, y: 0.2392), CGPoint(x: 0.188, y: 0.1439), CGPoint(x: 0.2661, y: 0.1908), CGPoint(x: 0.2333, y: 0.3125), CGPoint(x: 0.2566, y: 0.2604), CGPoint(x: 0.2365, y: 0.2919), CGPoint(x: 0.2005, y: 0.3838), CGPoint(x: 0.2272, y: 0.3531), CGPoint(x: 0.2334, y: 0.3683), CGPoint(x: 0.1398, y: 0.3565), CGPoint(x: 0.1675, y: 0.3993), CGPoint(x: 0.1647, y: 0.3824), CGPoint(x: 0.0833, y: 0.322), CGPoint(x: 0.1271, y: 0.3433), CGPoint(x: 0.0933, y: 0.3369), CGPoint(x: 0.1393, y: 0.1667), CGPoint(x: 0.0545, y: 0.2797), CGPoint(x: 0.0906, y: 0.1896), CGPoint(x: 0.2001, y: 0.6747), CGPoint(x: 0.2213, y: 0.795), CGPoint(x: 0.2118, y: 0.6747), CGPoint(x: 0.2213, y: 0.7286), CGPoint(x: 0.2001, y: 0.9153), CGPoint(x: 0.2213, y: 0.8614), CGPoint(x: 0.2118, y: 0.9153), CGPoint(x: 0.1789, y: 0.795), CGPoint(x: 0.1884, y: 0.9153), CGPoint(x: 0.1789, y: 0.8614), CGPoint(x: 0.2001, y: 0.6747), CGPoint(x: 0.1789, y: 0.7286), CGPoint(x: 0.1884, y: 0.6747), CGPoint(x: 0.2627, y: 0.7242), CGPoint(x: 0.2839, y: 0.8198), CGPoint(x: 0.2744, y: 0.7242), CGPoint(x: 0.2839, y: 0.767), CGPoint(x: 0.2627, y: 0.9153), CGPoint(x: 0.2839, y: 0.8725), CGPoint(x: 0.2744, y: 0.9153), CGPoint(x: 0.2414, y: 0.8198), CGPoint(x: 0.2509, y: 0.9153), CGPoint(x: 0.2414, y: 0.8725), CGPoint(x: 0.2627, y: 0.7242), CGPoint(x: 0.2414, y: 0.767), CGPoint(x: 0.2509, y: 0.7242), CGPoint(x: 0.3688, y: 0.4136), CGPoint(x: 0.3811, y: 0.5392), CGPoint(x: 0.3756, y: 0.4136), CGPoint(x: 0.3811, y: 0.4698), CGPoint(x: 0.3688, y: 0.6648), CGPoint(x: 0.3811, y: 0.6085), CGPoint(x: 0.3756, y: 0.6648), CGPoint(x: 0.3564, y: 0.5392), CGPoint(x: 0.362, y: 0.6648), CGPoint(x: 0.3564, y: 0.6085), CGPoint(x: 0.3688, y: 0.4136), CGPoint(x: 0.3564, y: 0.4698), CGPoint(x: 0.362, y: 0.4136), CGPoint(x: 0.4497, y: 0.4347), CGPoint(x: 0.445, y: 0.5608), CGPoint(x: 0.4564, y: 0.4362), CGPoint(x: 0.4542, y: 0.4927), CGPoint(x: 0.416, y: 0.6814), CGPoint(x: 0.4357, y: 0.6289), CGPoint(x: 0.4227, y: 0.6829), CGPoint(x: 0.4208, y: 0.5553), CGPoint(x: 0.4094, y: 0.6799), CGPoint(x: 0.4115, y: 0.6234), CGPoint(x: 0.4497, y: 0.4347), CGPoint(x: 0.43, y: 0.4872), CGPoint(x: 0.443, y: 0.4332), CGPoint(x: 0.5131, y: 0.474), CGPoint(x: 0.4999, y: 0.5995), CGPoint(x: 0.5197, y: 0.4762), CGPoint(x: 0.5138, y: 0.5325), CGPoint(x: 0.4628, y: 0.7168), CGPoint(x: 0.486, y: 0.6666), CGPoint(x: 0.4693, y: 0.7191), CGPoint(x: 0.476, y: 0.5913), CGPoint(x: 0.4562, y: 0.7145), CGPoint(x: 0.4621, y: 0.6583), CGPoint(x: 0.5131, y: 0.474), CGPoint(x: 0.4899, y: 0.5242), CGPoint(x: 0.5066, y: 0.4717), CGPoint(x: 0.5717, y: 0.5301), CGPoint(x: 0.5516, y: 0.6547), CGPoint(x: 0.5782, y: 0.533), CGPoint(x: 0.5692, y: 0.5888), CGPoint(x: 0.5081, y: 0.7688), CGPoint(x: 0.534, y: 0.7206), CGPoint(x: 0.5146, y: 0.7717), CGPoint(x: 0.5282, y: 0.6443), CGPoint(x: 0.5016, y: 0.7659), CGPoint(x: 0.5106, y: 0.7102), CGPoint(x: 0.5717, y: 0.5301), CGPoint(x: 0.5457, y: 0.5784), CGPoint(x: 0.5652, y: 0.5272), CGPoint(x: 0.6227, y: 0.6243), CGPoint(x: 0.5938, y: 0.7288), CGPoint(x: 0.6288, y: 0.6285), CGPoint(x: 0.6159, y: 0.6753), CGPoint(x: 0.5429, y: 0.8181), CGPoint(x: 0.5718, y: 0.7823), CGPoint(x: 0.549, y: 0.8223), CGPoint(x: 0.5717, y: 0.7136), CGPoint(x: 0.5368, y: 0.8139), CGPoint(x: 0.5497, y: 0.7671), CGPoint(x: 0.6227, y: 0.6243), CGPoint(x: 0.5937, y: 0.6601), CGPoint(x: 0.6166, y: 0.6201), CGPoint(x: 0.4477, y: 0.8867), CGPoint(x: 0.5407, y: 0.8593), CGPoint(x: 0.4477, y: 0.8716), CGPoint(x: 0.4893, y: 0.8593), CGPoint(x: 0.6339, y: 0.8867), CGPoint(x: 0.5922, y: 0.8593), CGPoint(x: 0.6339, y: 0.8716), CGPoint(x: 0.5407, y: 0.9141), CGPoint(x: 0.6339, y: 0.9019), CGPoint(x: 0.5922, y: 0.9141), CGPoint(x: 0.4477, y: 0.8867), CGPoint(x: 0.4893, y: 0.9141), CGPoint(x: 0.4477, y: 0.9019)]
    var eyesPoints1 = [CGPoint(x: 0.1565, y: 0.2104), CGPoint(x: 0.1777, y: 0.2378), CGPoint(x: 0.1682, y: 0.2104), CGPoint(x: 0.1777, y: 0.2227), CGPoint(x: 0.1565, y: 0.2652), CGPoint(x: 0.1777, y: 0.2529), CGPoint(x: 0.1682, y: 0.2652), CGPoint(x: 0.1353, y: 0.2378), CGPoint(x: 0.1448, y: 0.2652), CGPoint(x: 0.1353, y: 0.2529), CGPoint(x: 0.1565, y: 0.2104), CGPoint(x: 0.1353, y: 0.2227), CGPoint(x: 0.1448, y: 0.2104), CGPoint(x: 0.2494, y: 0.2104), CGPoint(x: 0.2706, y: 0.2378), CGPoint(x: 0.2611, y: 0.2104), CGPoint(x: 0.2706, y: 0.2227), CGPoint(x: 0.2494, y: 0.2652), CGPoint(x: 0.2706, y: 0.2529), CGPoint(x: 0.2611, y: 0.2652), CGPoint(x: 0.2282, y: 0.2378), CGPoint(x: 0.2377, y: 0.2652), CGPoint(x: 0.2282, y: 0.2529), CGPoint(x: 0.2494, y: 0.2104), CGPoint(x: 0.2282, y: 0.2227), CGPoint(x: 0.2377, y: 0.2104)]
    var eyesPoints2 = [CGPoint(x: 0.1122, y: 0.2441), CGPoint(x: 0.1393, y: 0.2605), CGPoint(x: 0.1232, y: 0.239), CGPoint(x: 0.1353, y: 0.2463), CGPoint(x: 0.1267, y: 0.2956), CGPoint(x: 0.1433, y: 0.2747), CGPoint(x: 0.1377, y: 0.2904), CGPoint(x: 0.0995, y: 0.2792), CGPoint(x: 0.1157, y: 0.3008), CGPoint(x: 0.1035, y: 0.2934), CGPoint(x: 0.1122, y: 0.2441), CGPoint(x: 0.0955, y: 0.265), CGPoint(x: 0.1012, y: 0.2493), CGPoint(x: 0.1994, y: 0.2031), CGPoint(x: 0.2266, y: 0.2195), CGPoint(x: 0.2104, y: 0.1979), CGPoint(x: 0.2226, y: 0.2053), CGPoint(x: 0.2139, y: 0.2546), CGPoint(x: 0.2306, y: 0.2337), CGPoint(x: 0.2249, y: 0.2494), CGPoint(x: 0.1868, y: 0.2382), CGPoint(x: 0.2029, y: 0.2597), CGPoint(x: 0.1908, y: 0.2524), CGPoint(x: 0.1994, y: 0.2031), CGPoint(x: 0.1828, y: 0.224), CGPoint(x: 0.1884, y: 0.2083)]
    var heartPoints1 = [CGPoint(x: 0.2627, y: 0.5523), CGPoint(x: 0.312, y: 0.5971), CGPoint(x: 0.2817, y: 0.5225), CGPoint(x: 0.3283, y: 0.5466), CGPoint(x: 0.2627, y: 0.6631), CGPoint(x: 0.3059, y: 0.6159), CGPoint(x: 0.291, y: 0.6384), CGPoint(x: 0.2134, y: 0.5971), CGPoint(x: 0.2343, y: 0.6384), CGPoint(x: 0.2195, y: 0.6159), CGPoint(x: 0.2627, y: 0.5523), CGPoint(x: 0.197, y: 0.5466), CGPoint(x: 0.2437, y: 0.5225)]
    var heartPoints2 = [CGPoint(x: 0.2561, y: 0.553), CGPoint(x: 0.3107, y: 0.5861), CGPoint(x: 0.2708, y: 0.5194), CGPoint(x: 0.32, y: 0.5327), CGPoint(x: 0.271, y: 0.6622), CGPoint(x: 0.3072, y: 0.606), CGPoint(x: 0.2956, y: 0.6315), CGPoint(x: 0.2136, y: 0.6082), CGPoint(x: 0.2398, y: 0.6442), CGPoint(x: 0.2221, y: 0.6254), CGPoint(x: 0.2561, y: 0.553), CGPoint(x: 0.1907, y: 0.5622), CGPoint(x: 0.2334, y: 0.528)]
    
    var body: some View {
        ZStack {
            Group {
                if let strokeStyle = strokeStyle {
                    BonesShape(points: isAnimated ? bonesPoints2 : bonesPoints1)
                        .stroke(style: strokeStyle)
                    EyesShape(points: isAnimated ? eyesPoints2 : eyesPoints1, outline: true)
                        .stroke(style: strokeStyle)
                } else {
                    BonesShape(points: isAnimated ? bonesPoints2 : bonesPoints1)
                        .mask(
                            EyesShape(points: isAnimated ? eyesPoints2 : eyesPoints1)
                                .fill(style: FillStyle(eoFill: true))
                                .animation(.easeInOut(duration: 2), value: isAnimated)
                        )
                }
            }
            .foregroundColor(.white)
            .animation(.easeInOut(duration: 2), value: isAnimated)
            Group {
                if let strokeStyle = strokeStyle {
                    HeartShape(points: isAnimated ? heartPoints2 : heartPoints1)
                        .stroke(style: strokeStyle)
                } else {
                    HeartShape(points: isAnimated ? heartPoints2 : heartPoints1)
                }
            }
            .foregroundColor(.red)
            .animation(.easeInOut(duration: 2), value: isAnimated)
        }
        .aspectRatio(495.48 / 383.45, contentMode: .fit)
        .onReceive(timer) { input in
            if Calendar.current.component(.second, from: input) % 4 == 0 {
                withAnimation {
                    isAnimated.toggle()
                }
            }
        }
    }
}

struct BonesShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 123 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addCurve(to: CGPoint(x: points[1].x * width, y: points[1].y * height), control1: CGPoint(x: points[2].x * width, y: points[2].y * height), control2: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        path.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        path.addCurve(to: CGPoint(x: points[13].x * width, y: points[13].y * height), control1: CGPoint(x: points[14].x * width, y: points[14].y * height), control2: CGPoint(x: points[15].x * width, y: points[15].y * height))
        path.addCurve(to: CGPoint(x: points[16].x * width, y: points[16].y * height), control1: CGPoint(x: points[17].x * width, y: points[17].y * height), control2: CGPoint(x: points[18].x * width, y: points[18].y * height))
        path.closeSubpath()
        
        var bone = Path()
        bone.move(to: CGPoint(x: points[19].x * width, y: points[19].y * height))
        bone.addCurve(to: CGPoint(x: points[20].x * width, y: points[20].y * height), control1: CGPoint(x: points[21].x * width, y: points[21].y * height), control2: CGPoint(x: points[22].x * width, y: points[22].y * height))
        bone.addCurve(to: CGPoint(x: points[23].x * width, y: points[23].y * height), control1: CGPoint(x: points[24].x * width, y: points[24].y * height), control2: CGPoint(x: points[25].x * width, y: points[25].y * height))
        bone.addCurve(to: CGPoint(x: points[26].x * width, y: points[26].y * height), control1: CGPoint(x: points[27].x * width, y: points[27].y * height), control2: CGPoint(x: points[28].x * width, y: points[28].y * height))
        bone.addCurve(to: CGPoint(x: points[29].x * width, y: points[29].y * height), control1: CGPoint(x: points[30].x * width, y: points[30].y * height), control2: CGPoint(x: points[31].x * width, y: points[31].y * height))
        bone.closeSubpath()
        
        var bone1 = Path()
        bone1.move(to: CGPoint(x: points[32].x * width, y: points[32].y * height))
        bone1.addCurve(to: CGPoint(x: points[33].x * width, y: points[33].y * height), control1: CGPoint(x: points[34].x * width, y: points[34].y * height), control2: CGPoint(x: points[35].x * width, y: points[35].y * height))
        bone1.addCurve(to: CGPoint(x: points[36].x * width, y: points[36].y * height), control1: CGPoint(x: points[37].x * width, y: points[37].y * height), control2: CGPoint(x: points[38].x * width, y: points[38].y * height))
        bone1.addCurve(to: CGPoint(x: points[39].x * width, y: points[39].y * height), control1: CGPoint(x: points[40].x * width, y: points[40].y * height), control2: CGPoint(x: points[41].x * width, y: points[41].y * height))
        bone1.addCurve(to: CGPoint(x: points[42].x * width, y: points[42].y * height), control1: CGPoint(x: points[43].x * width, y: points[43].y * height), control2: CGPoint(x: points[44].x * width, y: points[44].y * height))
        bone1.closeSubpath()
        
        var bone2 = Path()
        bone2.move(to: CGPoint(x: points[45].x * width, y: points[45].y * height))
        bone2.addCurve(to: CGPoint(x: points[46].x * width, y: points[46].y * height), control1: CGPoint(x: points[47].x * width, y: points[47].y * height), control2: CGPoint(x: points[48].x * width, y: points[48].y * height))
        bone2.addCurve(to: CGPoint(x: points[49].x * width, y: points[49].y * height), control1: CGPoint(x: points[50].x * width, y: points[50].y * height), control2: CGPoint(x: points[51].x * width, y: points[51].y * height))
        bone2.addCurve(to: CGPoint(x: points[52].x * width, y: points[52].y * height), control1: CGPoint(x: points[53].x * width, y: points[53].y * height), control2: CGPoint(x: points[54].x * width, y: points[54].y * height))
        bone2.addCurve(to: CGPoint(x: points[55].x * width, y: points[55].y * height), control1: CGPoint(x: points[56].x * width, y: points[56].y * height), control2: CGPoint(x: points[57].x * width, y: points[57].y * height))
        bone2.closeSubpath()
        
        var bone3 = Path()
        bone3.move(to: CGPoint(x: points[58].x * width, y: points[58].y * height))
        bone3.addCurve(to: CGPoint(x: points[59].x * width, y: points[59].y * height), control1: CGPoint(x: points[60].x * width, y: points[60].y * height), control2: CGPoint(x: points[61].x * width, y: points[61].y * height))
        bone3.addCurve(to: CGPoint(x: points[62].x * width, y: points[62].y * height), control1: CGPoint(x: points[63].x * width, y: points[63].y * height), control2: CGPoint(x: points[64].x * width, y: points[64].y * height))
        bone3.addCurve(to: CGPoint(x: points[65].x * width, y: points[65].y * height), control1: CGPoint(x: points[66].x * width, y: points[66].y * height), control2: CGPoint(x: points[67].x * width, y: points[67].y * height))
        bone3.addCurve(to: CGPoint(x: points[68].x * width, y: points[68].y * height), control1: CGPoint(x: points[69].x * width, y: points[69].y * height), control2: CGPoint(x: points[70].x * width, y: points[70].y * height))
        bone3.closeSubpath()
        
        var bone4 = Path()
        bone4.move(to: CGPoint(x: points[71].x * width, y: points[71].y * height))
        bone4.addCurve(to: CGPoint(x: points[72].x * width, y: points[72].y * height), control1: CGPoint(x: points[73].x * width, y: points[73].y * height), control2: CGPoint(x: points[74].x * width, y: points[74].y * height))
        bone4.addCurve(to: CGPoint(x: points[75].x * width, y: points[75].y * height), control1: CGPoint(x: points[76].x * width, y: points[76].y * height), control2: CGPoint(x: points[77].x * width, y: points[77].y * height))
        bone4.addCurve(to: CGPoint(x: points[78].x * width, y: points[78].y * height), control1: CGPoint(x: points[79].x * width, y: points[79].y * height), control2: CGPoint(x: points[80].x * width, y: points[80].y * height))
        bone4.addCurve(to: CGPoint(x: points[81].x * width, y: points[81].y * height), control1: CGPoint(x: points[82].x * width, y: points[82].y * height), control2: CGPoint(x: points[83].x * width, y: points[83].y * height))
        bone4.closeSubpath()
        
        var bone5 = Path()
        bone5.move(to: CGPoint(x: points[84].x * width, y: points[84].y * height))
        bone5.addCurve(to: CGPoint(x: points[85].x * width, y: points[85].y * height), control1: CGPoint(x: points[86].x * width, y: points[86].y * height), control2: CGPoint(x: points[87].x * width, y: points[87].y * height))
        bone5.addCurve(to: CGPoint(x: points[88].x * width, y: points[88].y * height), control1: CGPoint(x: points[89].x * width, y: points[89].y * height), control2: CGPoint(x: points[90].x * width, y: points[90].y * height))
        bone5.addCurve(to: CGPoint(x: points[91].x * width, y: points[91].y * height), control1: CGPoint(x: points[92].x * width, y: points[92].y * height), control2: CGPoint(x: points[93].x * width, y: points[93].y * height))
        bone5.addCurve(to: CGPoint(x: points[94].x * width, y: points[94].y * height), control1: CGPoint(x: points[95].x * width, y: points[95].y * height), control2: CGPoint(x: points[96].x * width, y: points[96].y * height))
        bone5.closeSubpath()
        
        var bone6 = Path()
        bone6.move(to: CGPoint(x: points[97].x * width, y: points[97].y * height))
        bone6.addCurve(to: CGPoint(x: points[98].x * width, y: points[98].y * height), control1: CGPoint(x: points[99].x * width, y: points[99].y * height), control2: CGPoint(x: points[100].x * width, y: points[100].y * height))
        bone6.addCurve(to: CGPoint(x: points[101].x * width, y: points[101].y * height), control1: CGPoint(x: points[102].x * width, y: points[102].y * height), control2: CGPoint(x: points[103].x * width, y: points[103].y * height))
        bone6.addCurve(to: CGPoint(x: points[104].x * width, y: points[104].y * height), control1: CGPoint(x: points[105].x * width, y: points[105].y * height), control2: CGPoint(x: points[106].x * width, y: points[106].y * height))
        bone6.addCurve(to: CGPoint(x: points[107].x * width, y: points[107].y * height), control1: CGPoint(x: points[108].x * width, y: points[108].y * height), control2: CGPoint(x: points[109].x * width, y: points[109].y * height))
        bone6.closeSubpath()
        
        var bone7 = Path()
        bone7.move(to: CGPoint(x: points[110].x * width, y: points[110].y * height))
        bone7.addCurve(to: CGPoint(x: points[111].x * width, y: points[111].y * height), control1: CGPoint(x: points[112].x * width, y: points[112].y * height), control2: CGPoint(x: points[113].x * width, y: points[113].y * height))
        bone7.addCurve(to: CGPoint(x: points[114].x * width, y: points[114].y * height), control1: CGPoint(x: points[115].x * width, y: points[115].y * height), control2: CGPoint(x: points[116].x * width, y: points[116].y * height))
        bone7.addCurve(to: CGPoint(x: points[117].x * width, y: points[117].y * height), control1: CGPoint(x: points[118].x * width, y: points[118].y * height), control2: CGPoint(x: points[119].x * width, y: points[119].y * height))
        bone7.addCurve(to: CGPoint(x: points[120].x * width, y: points[120].y * height), control1: CGPoint(x: points[121].x * width, y: points[121].y * height), control2: CGPoint(x: points[122].x * width, y: points[122].y * height))
        bone7.closeSubpath()
        
        path.addPath(bone)
        path.addPath(bone1)
        path.addPath(bone2)
        path.addPath(bone3)
        path.addPath(bone4)
        path.addPath(bone5)
        path.addPath(bone6)
        path.addPath(bone7)
        return path
    }
}

struct EyesShape: Shape {
    var points: [CGPoint]
    var outline: Bool = false
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 26 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var eye = Path()
        eye.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        eye.addCurve(to: CGPoint(x: points[1].x * width, y: points[1].y * height), control1: CGPoint(x: points[2].x * width, y: points[2].y * height), control2: CGPoint(x: points[3].x * width, y: points[3].y * height))
        eye.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        eye.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        eye.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        eye.closeSubpath()
        
        var eye1 = Path()
        eye1.move(to: CGPoint(x: points[13].x * width, y: points[13].y * height))
        eye1.addCurve(to: CGPoint(x: points[14].x * width, y: points[14].y * height), control1: CGPoint(x: points[15].x * width, y: points[15].y * height), control2: CGPoint(x: points[16].x * width, y: points[16].y * height))
        eye1.addCurve(to: CGPoint(x: points[17].x * width, y: points[17].y * height), control1: CGPoint(x: points[18].x * width, y: points[18].y * height), control2: CGPoint(x: points[19].x * width, y: points[19].y * height))
        eye1.addCurve(to: CGPoint(x: points[20].x * width, y: points[20].y * height), control1: CGPoint(x: points[21].x * width, y: points[21].y * height), control2: CGPoint(x: points[22].x * width, y: points[22].y * height))
        eye1.addCurve(to: CGPoint(x: points[23].x * width, y: points[23].y * height), control1: CGPoint(x: points[24].x * width, y: points[24].y * height), control2: CGPoint(x: points[25].x * width, y: points[25].y * height))
        eye1.closeSubpath()
        
        if outline {
            eye.addPath(eye1)
            return eye
        }
        
        var path = Rectangle().path(in: rect)
        path.addPath(eye)
        path.addPath(eye1)
        return path
    }
}

struct HeartShape: Shape {
    var points: [CGPoint]
    
    var animatableData: AnimatablePoints {
        get { AnimatablePoints(points: points) }
        set { points = newValue.points }
    }
    
    func path(in rect: CGRect) -> Path {
        if points.count < 13 { return Path() }
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: CGPoint(x: points[0].x * width, y: points[0].y * height))
        path.addCurve(to: CGPoint(x: points[1].x * width, y: points[1].y * height), control1: CGPoint(x: points[2].x * width, y: points[2].y * height), control2: CGPoint(x: points[3].x * width, y: points[3].y * height))
        path.addCurve(to: CGPoint(x: points[4].x * width, y: points[4].y * height), control1: CGPoint(x: points[5].x * width, y: points[5].y * height), control2: CGPoint(x: points[6].x * width, y: points[6].y * height))
        path.addCurve(to: CGPoint(x: points[7].x * width, y: points[7].y * height), control1: CGPoint(x: points[8].x * width, y: points[8].y * height), control2: CGPoint(x: points[9].x * width, y: points[9].y * height))
        path.addCurve(to: CGPoint(x: points[10].x * width, y: points[10].y * height), control1: CGPoint(x: points[11].x * width, y: points[11].y * height), control2: CGPoint(x: points[12].x * width, y: points[12].y * height))
        path.closeSubpath()
        return path
    }
}
