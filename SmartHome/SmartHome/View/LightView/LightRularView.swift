//
//  LightRularView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct LightRularView: View {
    
    // MARK: - Property
    
    var sliderHeight: CGFloat = 350
    
    @Binding var percentage: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 14) {
            VStack (alignment: .leading) {
                ForEach(Array(stride(from: 100, through: 0, by: -10)), id: \.self) { i in
                    Text("\(i)%")
                        .foregroundColor(.mainTextColor)
                    
                    if i != 0 {
                        Spacer()
                    }
                }
            } //: VStack
            .frame(height: sliderHeight)
            
            VStack (alignment: .trailing) {
                ForEach(Array(stride(from: 100, through: 0, by: -1)), id: \.self) { i in
                    Rectangle()
                        .fill(Color.blue)
                        .opacity(0.6)
                        .frame(width: i % 10 == 0 ? 20 : 10, height: i % 10 == 0 ? 1.5 : 1)
                    
                    if i != 0 {
                        Spacer(minLength: 0)
                    }
                }
            } //: VStack
            .padding(.vertical, 10)
            .frame(height: sliderHeight)
        } //: HStack
    }
}

// MARK: - Preview

struct LightRularView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
