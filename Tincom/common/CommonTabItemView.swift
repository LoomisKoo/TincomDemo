//
//  CommonTabItemView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/9/7.
//

import SwiftUI

// MARK: 一般tabItemView

struct CommonTabItemView<Content>: View where Content: View {
    let text: String /// 按钮文案
    let icon: String /// 按钮icon（systemName）
    let tag: Int /// selection tag
    let content: () -> Content /// tab对应的页面

    var body: some View {
        content()
            .tabItem {
                Label(
                    title: { Text(text) },
                    icon: {
                        Image(systemName: icon)
                    }
                )
            }
            .tag(tag)
    }
}
