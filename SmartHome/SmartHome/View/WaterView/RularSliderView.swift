//
//  RularSliderView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct RularSliderView: View {
    
    // MARK: - Property
    
    var rularHeight = UIScreen.screenHeight - 260 - 28
    var knobRadius: CGFloat = 30
    
    @Binding var humidity: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // MARK: - Rular
            VStack (alignment: .trailing) {
                ForEach(Array(stride(from: 100, through: 0, by: -2)), id: \.self) { i in
                    Rectangle()
                        .fill(i % 10 == 0 ? Color.blueButton1 : Color.waterBlue)
                        .frame(width: i % 10 == 0 ? 30 : 18, height: 1)
                        .offset(x: moveRularLeft(value: i))
                    
                    if i != 0 {
                        Spacer()
                    }
                }
            } //: VStack
            .frame(height: rularHeight)
            
            // MARK: - Slider
            WaterSliderShape(humidity: humidity)
                .stroke(lineWidth: 8)
                .fill(Color.sliderBlueGradient)
                .frame(width: 4, height: rularHeight)
            
            // MARK: - Knob
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: knobRadius, height: knobRadius)
                    .shadow(color: Color.gray.opacity(0.28), radius: 8, x: -6, y: 6)
                
                Circle()
                    .fill(Color.bgColor.opacity(0.5))
                    .frame(width: 18, height: 18)
                
                Circle()
                    .fill(Color.waterBlue)
                    .frame(width: 10, height: 10)
            } //: ZStack
            .offset(x: -20, y: rularHeight / 2)
            .offset(y: -rularHeight * humidity / 100)
            .gesture(
                DragGesture(minimumDistance: 5)
                    .onChanged({ value in
                        changeSlider(value: value)
                    })
            ) //: gesture
            
        } //: HStack
    }
    
    
    // MARK: - Function
    
    func changeSlider(value: DragGesture.Value) {
        let yLocatoin = value.location.y
        
        let height = 320 - yLocatoin
        
        if 0 <= height && height <= rularHeight + 1 {
            humidity = height / rularHeight * 100
        }
    }
    
    func moveRularLeft(value: Int) -> CGFloat {
        let minRange = humidity - 9
        let maxRange = humidity + 9
        
        let range = minRange...maxRange
        
        if range.contains(CGFloat(value)) {
            let DistanceFromCenter = abs(CGFloat(value) - humidity)  // 0 ~ 9
            
            let leftOffset: CGFloat = -28 + DistanceFromCenter * 28 / 9
            
            return leftOffset
        }
        
        return 0
    }
}

// MARK: - Preview

struct RularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
