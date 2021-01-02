//
//  LightControlView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct LightControlView: View {
    
    // MARK: - Property
    
    var sliderWidth: CGFloat = 170
    var sliderHeight: CGFloat = 350
    
    var cornerRadius: CGFloat = 40
    
    @Binding var percentage: CGFloat  // 0 ~ 100
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            // MARK: - Background
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .frame(width: sliderWidth, height: sliderHeight)
                .shadow(color: Color.gray.opacity(0.28), radius: 10, x: -8, y: 8)
            
            // MARK: - Slider
            
            LightSliderShape(progress: percentage / 100)
                .fill(Color.sliderYellowGradient)
                .frame(width: sliderWidth, height: sliderHeight)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            
            // MARK: - Knob
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    .shadow(color: Color.gray.opacity(0.28), radius: 8, x: -6, y: 6)
                
                Circle()
                    .fill(Color.bgColor.opacity(0.5))
                    .frame(width: 18, height: 18)
                
                Circle()
                    .fill(Color.toggleYellow2)
                    .frame(width: 10, height: 10)
            } //: ZStack
            .offset(x: sliderWidth/2, y: -sliderHeight * percentage / 100 + 15)
            .offset(x: slideCurveOffset(percentage: percentage))
            .gesture(
                DragGesture(minimumDistance: 5)
                    .onChanged({ value in
                        changeSlider(value: value)
                    })
            ) //: gesture
            
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func changeSlider(value: DragGesture.Value) {
        let yLocation = value.location.y
        
        let locationHeight = 30 - yLocation // 0 ~ 350
        
        if 0 <= locationHeight && locationHeight <= 350 {
            percentage = locationHeight / sliderHeight * 100
        }
    }
    
    func slideCurveOffset(percentage: CGFloat) -> CGFloat {
        let lowCurveStart = cornerRadius / sliderHeight * 100  // 0 ~ 100
        let highCurveStart = (sliderHeight - cornerRadius) / sliderHeight * 100  // 0 ~ 100
        
        if percentage <= lowCurveStart {
            let h = (cornerRadius - sliderHeight * percentage / 100)
            
            if 0 <= h && h <= 40 {
                let x = pow((pow(cornerRadius, 2)) - (pow(h, 2)), 0.5)
                
                return -(cornerRadius - x)
            }
            return -cornerRadius
        }
        else if percentage > highCurveStart {
            let h = sliderHeight * (percentage - highCurveStart) / 100
            
            if 0 <= h && h <= 40 {
                let x = pow((pow(cornerRadius, 2)) - (pow(h, 2)), 0.5)
                
                return -(cornerRadius - x)
            }
            return -cornerRadius
        }
        else {
            return 0
        }
    }
    
}

// MARK: - Preview

struct LightControlView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
