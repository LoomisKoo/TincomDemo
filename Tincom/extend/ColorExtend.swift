//
//  Color.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/8/13.
//

import Foundation
import SwiftUI

// MARK: 扩展Color
extension Color {
    
    /// 十六进制转颜色值
    /// 例：olor(hex: 0x2C2C2C)
    init(hex: UInt32) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
