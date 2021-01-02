//
//  TemperatureView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct TemperatureView: View {
    
    // MARK: - Property
    
    @Binding var temperatureValue: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Title
            Text("Living Room")
                .foregroundColor(.mainTextColor)
                .font(.system(size: 40, weight: .bold, design: .rounded))
            
            Text("Temperature")
                .foregroundColor(.mainLightColor)
                .font(.system(size: 20, weight: .regular, design: .rounded))
                .padding(.top, 4)
            
            // MARK:-  Controller
            TemperatureControlView(temperatureValue: $temperatureValue)
                .padding(.vertical, 50)
            
            // MARK: - Temperature Value
            HStack (alignment: .bottom, spacing: 2) {
                Text("\(Int(temperatureValue))")
                    .font(.system(size: 80, weight: .light, design: .default))
                Text("℃")
                    .font(.system(size: 35, weight: .light, design: .default))
                    .padding(.bottom, 8)
            } //: HStack
            .foregroundColor(.mainTextColor)
        } //: VStack
    }
}

// MARK: - Preview

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
