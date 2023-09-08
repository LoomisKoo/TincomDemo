//
//  LazyGridView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/25.
//

import Foundation
import SwiftUI

// MARK: LazyVGrid的简单封装

struct LazyVGridView<Content: View>: View {
    private var columnsCount: Int
    private var hSpacing: CGFloat
    private var vSpacing: CGFloat
    private var content: () -> Content // 闭包回调

    init(
        columnsCount: Int,
        hSpacing: CGFloat = 8,
        vSpacing: CGFloat = 8,
        content: @escaping () -> Content
    ) {
        self.columnsCount = columnsCount
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
        self.content = content
    }

    var body: some View {
        LazyVGrid(columns: createGridItems(), spacing: vSpacing) {
            content() // 调用闭包回调，显示具体的内容
        }
    }

    private func createGridItems() -> [GridItem] {
        return Array(repeating: GridItem(spacing: hSpacing), count: columnsCount)
    }
}
