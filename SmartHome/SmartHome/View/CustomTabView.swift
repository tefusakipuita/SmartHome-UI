//
//  CustomTabView.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct CustomTabView: View {
    
    // MARK: - Property
    
    var tabSpace = (UIScreen.screenWidth - 250) / 4 - 10
    
    @ObservedObject var manager: TabManager
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Tab Bar Background
            Capsule()
                .fill(Color.tabBarGradient)
                .frame(height: 80)
            
            HStack (spacing: tabSpace) {
                ForEach(manager.data) { tab in
                    ZStack {
                        
                        // MARK: - Tab Button Background
                        Circle()
                            .fill(tab.gradient)
                            .opacity(manager.selected == tab.id ? 1 : 0)
                            .frame(width: 50, height: 50)
                        
                        // MARK: - Tab Image
                        Image(systemName: tab.imageName)
                            .foregroundColor(manager.selected == tab.id ? .white : .tabButtonColor)
                            .font(.title2)
                            .background(
                                
                                // MARK: - Top Right Circle Shadow
                                Circle()
                                    .stroke(lineWidth: 7)
                                    .fill(Color.black.opacity(0.15))
                                    .opacity(manager.selected == tab.id ? 1 : 0)
                                    .frame(width: 65, height: 65)
                                    .offset(x: -7, y: 7)
                            )
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } //: ZStack
                    .animation(.easeOut)
                    .onTapGesture {
                        manager.selected = tab.id
                    }
                } //: ForEach
            } //: HStack
        } //: ZStack
    }
}

// MARK: - Preview

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
