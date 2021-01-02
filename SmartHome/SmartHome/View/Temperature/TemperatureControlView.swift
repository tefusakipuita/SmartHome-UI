//
//  TemperatureControlView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct TemperatureControlView: View {
    
    // MARK: - Property
    
    var circleWidth = UIScreen.screenWidth - 100
    
    let minValue: CGFloat = 15
    let maxValue: CGFloat = 40
    
    @Binding var temperatureValue: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - OutSide Circle
            Circle()
                .stroke(Color.mainLightColor, lineWidth: 0.5)
                .frame(width: circleWidth, height: circleWidth)
            
            // MARK: - Range Stroke
            Circle()
                .trim(from: 5/8, to: 7/8)
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .fill(Color.temperatureRangeGradient)
                .frame(width: circleWidth, height: circleWidth)
            
            // MARK: - Small Knob
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 27, height: 27)
                    .offset(y: -circleWidth/2)
                    .rotationEffect(Angle(degrees: Double((temperatureValue - minValue) / (maxValue - minValue)) * 90))
                    .shadow(color: Color.gray.opacity(0.38), radius: 3, x: -4, y: 4)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 22, height: 22)
                    .offset(y: -circleWidth/2)
                    .rotationEffect(Angle(degrees: Double((temperatureValue - minValue) / (maxValue - minValue)) * 90))
                    .shadow(color: Color.gray.opacity(0.18), radius: 6, x: -8, y: 8)
            } //: ZStack
            .rotationEffect(Angle(degrees: -45))
            .gesture(
                DragGesture(minimumDistance: 5)
                    .onChanged({ value in
                        changeTemperature(value: value)
                    })
            ) //: gesture
            
            // MARK: - Rular Circle
            Circle()
                .stroke(Color.mainLightColor.opacity(0.4), style: StrokeStyle(lineWidth: 8, lineCap: .butt, dash: [1, 10]))
                .frame(width: circleWidth - 40, height: circleWidth - 40)
            
            // MARK: - Needle
            NeedleShape()
                .fill(Color.white)
                .frame(width: 30, height: 30)
                .offset(y: -(circleWidth - 95)/2)
                .rotationEffect(Angle(degrees: -45))
                .rotationEffect(Angle(degrees: Double((temperatureValue - minValue) / (maxValue - minValue)) * 90))
                .shadow(color: Color.gray.opacity(0.38), radius: 6, x: -3, y: 0)
            
            // MARK: - Center Knob
            Circle()
                .fill(Color.white)
                .frame(width: circleWidth - 95, height: circleWidth - 95)
                .shadow(color: Color.gray.opacity(0.28), radius: 10, x: -8, y: 8)

            Circle()
                .fill(Color.white)
                .frame(width: circleWidth - 110, height: circleWidth - 110)
                .shadow(color: Color.gray.opacity(0.15), radius: 8, x: -8, y: 8)

            // MARK: - Center of Center Knob
            Circle()
                .fill(Color.centerKnobCircle)
                .frame(width: 50, height: 50)

            Circle()
                .fill(Color.temperatureGreen)
                .frame(width: 20, height: 20)
            
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func changeTemperature(value: DragGesture.Value) {
        let x = value.location.x
        let y = value.location.y
        
        let angle = atan2(y - 15, x - 15) * 180 / .pi + 135  // 0° ~ 90°
        
        let progressPercentage = angle / 90
        
        if 0 <= angle && angle <= 91 {
            temperatureValue = minValue + progressPercentage * (maxValue - minValue)
        }
    }
}

// MARK: - Preview

struct TemperatureControlView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
