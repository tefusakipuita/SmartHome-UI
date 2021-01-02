//
//  ToggleView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct ToggleView: View {
    
    // MARK: - Property
    
    var gradient: LinearGradient
    
    @Binding var toggleOn: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Auto Adjust")
                .font(.system(size: 13))
                .foregroundColor(.mainTextColor)
            
            ZStack (alignment: .trailing) {
                Capsule()
                    .fill(Color.toggleShadowGradient)
                    .frame(width: 100, height: 30)
                    .shadow(color: Color.gray.opacity(0.1), radius: 4, x: -2, y: 2)
                
                Capsule()
                    .fill(gradient)
                    .frame(width: 46, height: 24)
                    .padding(.trailing, 4)
                    .offset(x: toggleOn ? 0 : -46)
                    .shadow(color: Color.yellowButton1.opacity(0.6), radius: 4, x: -2, y: 2)
                    .onTapGesture(perform: {
                        withAnimation {
                            toggleOn.toggle()
                        }
                    })
                    
            } //: ZStack
            .padding(.bottom, 12)
        } //: VStack
    }
}

// MARK: - Preview

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
