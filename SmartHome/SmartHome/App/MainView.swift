//
//  ContentView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = TabManager()
    
    @State var temperatureValue: CGFloat = 25
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.backgroundGradient
                .rotationEffect(Angle(degrees: 180))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // MARK: - Main
                if manager.selected == 0 {
                    TemperatureView(temperatureValue: $temperatureValue)
                        .padding(.top, 30)
                        .padding(.horizontal, 50)
                }
                else if manager.selected == 1 {
                    LightView()
                        .padding(.top, 30)
                        .padding(.horizontal, 50)
                }
                else if manager.selected == 2 {
                    WaterView(temperatureValue: $temperatureValue)
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
                
                // MARK: - Tab Bar
                CustomTabView(manager: manager)
                    .padding(.horizontal, 50)
            } //: VStack
            
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
