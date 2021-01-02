//
//  LightView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct LightView: View {
    
    // MARK: - Property
    
    @State var percentage: CGFloat = 69
        
    @State var toggleOn = true
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Title
            Text("Light")
                .foregroundColor(.mainTextColor)
                .font(.system(size: 40, weight: .bold, design: .rounded))
            
            HStack {
                
                // MARK: - Control
                LightControlView(percentage: $percentage)
                
                Spacer()
                
                // MARK:- Rular
                LightRularView(percentage: $percentage)
                
            } //: HStack
            .padding(.vertical, 60)
            
            HStack (alignment: .bottom) {
                
                // MARK: - Toggle
                ToggleView(gradient: Color.toggleYellowGradient, toggleOn: $toggleOn)
                
                Spacer()
                
                // MARK:- Percentage Value
                Text("\(Int(percentage))%")
                    .font(.system(size: 55, weight: .light, design: .default))
                    .foregroundColor(.mainTextColor)
                
            } //: HStack
            
        } //: VStack
    }
}

// MARK: - Preview

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
