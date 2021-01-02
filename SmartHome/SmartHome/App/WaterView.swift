//
//  WaterView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct WaterView: View {
    
    // MARK: - Property
    
    @Binding var temperatureValue: CGFloat
    
    @State var humidity: CGFloat = 55
    
    @State var toggleOn = true
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // MARK: - Percentage Value
            VStack (alignment: .leading) {
                ForEach(Array(stride(from: 100, through: 0, by: -10)), id: \.self) { i in
                    Text("\(i)%")
                        .scaleEffect(inRange(value: i) ? 1.4 : 1, anchor: .leading)
                        .foregroundColor(inRange(value: i) ? .waterBlue : .mainTextColor)
                        .font(.system(size: 24))
                    
                    if i != 0 {
                        Spacer()
                    }
                }
            } //: VStack
            .frame(height: UIScreen.screenHeight - 260)
            .animation(.easeOut)
            
            // MARK: - Rular View
            RularSliderView(humidity: $humidity)
                .padding(.leading, 40)
            
            Spacer()
            
            // MARK: - Each Data
            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    Text("Temperature")
                        .foregroundColor(.mainLightColor)
                    
                    HStack (alignment: .bottom, spacing: 0) {
                        Text("\(Int(temperatureValue))")
                            .font(.system(size: 40, weight: .light, design: .default))
                        
                        Text("℃")
                            .font(.system(size: 20, weight: .light, design: .default))
                            .padding(.bottom, 8)
                    } //: HStack
                } //: VStack
                .padding(.bottom, 40)
                
                VStack (alignment: .leading) {
                    Text("Air Humidity")
                        .foregroundColor(.mainLightColor)
                        .font(.system(size: 18))
                    
                    HStack (alignment: .bottom) {
                        Text("\(Int(humidity))")
//                            .fixedSize()
                        
                        Text("%")
                        
                        Spacer(minLength: 0)
                    } //: HStack
                    .font(.system(size: 55, weight: .light, design: .default))
                } //: VStack
                .padding(.bottom, 40)
                
                VStack (alignment: .leading) {
                    Text("Normal Humidity")
                        .foregroundColor(.mainLightColor)
                        .fixedSize()
                    
                    HStack (alignment: .bottom, spacing: 0) {
                        Text("50")
                            .font(.system(size: 40, weight: .light, design: .default))
                        
                        Text("%")
                            .font(.system(size: 20, weight: .light, design: .default))
                            .padding(.bottom, 8)
                    } //: HStack
                } //: VStack
                .padding(.bottom, 40)
                
                ToggleView(gradient: Color.toggleBlueGradient, toggleOn: $toggleOn)
                
            } //: VStack
            .padding(.top, 70)
            .padding(.leading, 10)
            
        } //: HStack
    }
    
    
    // MARK: - Function
    
    func inRange(value: Int) -> Bool {
        let range = value..<value + 10
        
        return range.contains(Int(humidity))
    }
}

// MARK: - Preview

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
