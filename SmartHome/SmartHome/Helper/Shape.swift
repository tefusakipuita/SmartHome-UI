//
//  Shape.swift
//  SmartHome
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI


// MARK: - NeedleShape
struct NeedleShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        
        var path = Path()
        
        path.move(to: CGPoint(x: width/2, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()
        
        return path
    }
}

// MARK: - LightSliderShape
struct LightSliderShape: Shape {
    var progress: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let progressHeight = height * (1 - progress)
        
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: progressHeight + 30))
        
        path.addQuadCurve(to: CGPoint(x: 30, y: progressHeight), control: CGPoint(x: 0, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        
        return path
    }
}


// MARK: - WaterSliderShape
struct WaterSliderShape: Shape {
    var humidity: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let height = rect.height
        let progressHeight = height * (1 - humidity / 100)
        
        let controlPoint1 = CGPoint(x: 0, y: progressHeight - 20)
        let controlPoint2 = CGPoint(x: -25, y: progressHeight - 20)
        
        let controlPoint3 = CGPoint(x: -25, y: progressHeight + 20)
        let controlPoint4 = CGPoint(x: 0, y: progressHeight + 20)
        
        // MARK: - Path
        var path = Path()
        
        // 1. 一番上
        path.move(to: CGPoint(x: 0, y: 0))
        
        if progressHeight > 60 {
            // 2. カーブ開始地点
            path.addLine(to: CGPoint(x: 0, y: progressHeight - 60))
        }
        
        // 3. スライダーの高さと同じ座標 (１番くぼんでいる所)
        path.addCurve(to: CGPoint(x: -25, y: progressHeight), control1: controlPoint1, control2: controlPoint2)
        
        if progressHeight < (height - 60) {
            // 4. カーブ終了地点
            path.addCurve(to: CGPoint(x: 0, y: progressHeight + 60), control1: controlPoint3, control2: controlPoint4)
            
            // 5. 一番下
            path.addLine(to: CGPoint(x: 0, y: height))
        }
        else {
            // 4. カーブ終了地点 (めちゃ下までスクロールした場合)
            path.addCurve(to: CGPoint(x: 0, y: height), control1: controlPoint3, control2: controlPoint4)
        }
        
        return path
    }
}
