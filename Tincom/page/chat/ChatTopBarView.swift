//
//  TopBarView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/11.
//

import SwiftUI

// MARK: 聊天界面顶部栏

struct ChatTopBarView: View {
    private let onBack: () -> Void

    init(onBack: @escaping () -> Void) {
        self.onBack = onBack
    }

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.white.opacity(0.8))
                .frame(width: 40, height: 40)
                .background(.fill.tertiary)
                .clipShape(Circle())
                .hoverCircleEffect()
                .onTapGesture {
                    onBack()
                }

            /// 搜索框
            ChatSearchView { _ in
                /// 这里搜索
            }
            .frame(width: 400)

            Image(systemName: "plus")
                .foregroundColor(.white.opacity(0.8))
                .frame(width: 40, height: 40)
                .background(.fill.tertiary)
                .clipShape(Circle())
                .hoverCircleEffect()
        }
        .padding(10)
        .padding(.horizontal, 10)
        .glassBackgroundEffect()
        .padding(.bottom, 90)
    }
}

#Preview {
    ChatTopBarView {}
}
