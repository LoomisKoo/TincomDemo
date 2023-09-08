//
//  PictureWall.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/17.
//

import Foundation
import SwiftUI

// 本想实现光标（视觉焦点）在哪，哪里图片就稍微放大（类似docker栏的动画效果）。但是visionOS似乎不支持视觉焦点的获取
// TODO: 退而求其次，以拖拽的方式实现（交互体验待验证）
struct PictureWall: View {
    let rowCount = 6
    
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        ScrollView {
            LazyVGridView(columnsCount: rowCount, hSpacing: 0.5, vSpacing: 0.5) {
                ForEach(0 ..< 100) { index in
                    PictureView(title: "\(index)")
                        .onTapGesture {
                            openWindow(id: "newWindow")
                        }
                }
            }
        }
        .background(.clear)
        .toolbar {
            ToolbarItem(placement: .bottomOrnament) {
                PictureWallToolBar()
            }
        }
    }
}

struct PictureView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit) // 保持正方形比例
            .background(Color.blue)
            .foregroundColor(.white)
            .hoverEffect()
    }
}

#Preview() {
    PictureWall()
}
