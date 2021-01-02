//
//  Extension.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI


extension Color {
    
    // MARK: - Color
    
    static let mainTextColor = Color("mainTextColor")
    static let mainLightColor = Color("mainLightColor")
    static let bgColor = Color("bgColor")
    
    static let tabBar1 = Color("tabBar1")
    static let tabBar2 = Color("tabBar2")
    
    static let greenButton1 = Color("greenButton1")
    static let greenButton2 = Color("greenButton2")
    static let blueButton1 = Color("blueButton1")
    static let blueButton2 = Color("blueButton2")
    static let yellowButton1 = Color("yellowButton1")
    static let yellowButton2 = Color("yellowButton2")
    static let tabButtonColor = Color("tabButtonColor")
    
    static let temperatureGreen = Color("temperatureGreen")
    static let temperaturePink = Color("temperaturePink")
    
    static let toggleShadow = Color("toggleShadow")
    static let toggleYellow1 = Color("toggleYellow1")
    static let toggleYellow2 = Color("toggleYellow2")
    
    static let waterBlue = Color("waterBlue")
    
    
    // MARK: - Gradient
    
    // Main
    static let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.white, Color.bgColor]), startPoint: .top, endPoint: .bottom)
    
    // Tab
    static let tabBarGradient = LinearGradient(gradient: Gradient(colors: [Color.tabBar1, Color.tabBar2]), startPoint: .leading, endPoint: .trailing)
    
    static let greenButtonGradient = LinearGradient(
        gradient: Gradient(colors: [Color.greenButton1, Color.greenButton2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

    static let blueButtonGradient = LinearGradient(
        gradient: Gradient(colors: [Color.blueButton1, Color.blueButton2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

    static let yellowButtonGradient = LinearGradient(
        gradient: Gradient(colors: [Color.yellowButton1, Color.yellowButton2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    // Temperature
    static let temperatureRangeGradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: .temperatureGreen, location: 0.25),
            .init(color: .yellow, location: 0.5),
            .init(color: .temperaturePink, location: 0.75)
        ]),
        startPoint: .leading,
        endPoint: .trailing)
    
    static let centerKnobCircle = LinearGradient(
        gradient: Gradient(colors: [Color.bgColor.opacity(0.7), Color.bgColor.opacity(0.2)]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    // Light
    static let toggleShadowGradient = LinearGradient(gradient: Gradient(colors: [Color.toggleShadow, Color.white]), startPoint: .top, endPoint: .bottom)
    
    static let toggleYellowGradient = LinearGradient(gradient: Gradient(colors: [Color.toggleYellow1, Color.toggleYellow2]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    static let sliderYellowGradient = LinearGradient(gradient: Gradient(colors: [Color.toggleYellow1, Color.toggleYellow2]), startPoint: .top, endPoint: .bottom)
    
    static let toggleBlueGradient = LinearGradient(gradient: Gradient(colors: [Color.blueButton2, Color.blueButton1]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    // Water
    static let sliderBlueGradient = LinearGradient(gradient: Gradient(colors: [Color.waterBlue.opacity(0.001), Color.waterBlue, Color.waterBlue.opacity(0.001)]), startPoint: .top, endPoint: .bottom)
}


extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}
