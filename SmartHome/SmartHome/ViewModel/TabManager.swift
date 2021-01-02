//
//  TabManager.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

class TabManager: ObservableObject {
    
    @Published var data = Data.menus
    
    @Published var selected = 0
}
