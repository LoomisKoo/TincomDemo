//
//  MusicTopBarRightView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/21.
//

import Foundation
import SwiftUI

struct MusicTopBarRightView: View {
    var body: some View {
        HStack(spacing: 16) {
            /// 搜索框
            MusicSearchView()
            /// 设置
            FunctionButton("gearshape")
            /// 消息
            FunctionButton("envelope")
            /// 皮肤
            FunctionButton("tshirt")
        }
    }
}

// MARK: 各个功能按钮

private struct FunctionButton: View {
    private var buttonSize: CGFloat = 44

    private var onClick: (() -> Void)?

    var imaName: String = ""

    init(_ imaName: String, buttonSize: CGFloat = 25, onClick: (() -> Void)? = nil) {
        self.onClick = onClick
        self.buttonSize = buttonSize
        self.imaName = imaName
    }

    var body: some View {
        Button(action: {
            onClick?()
        }, label: {
            Image(systemName: imaName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: buttonSize, height: buttonSize)
                .padding(8)
                .opacity(0.6)
        })
        .hoverCircleEffect(hPadding: 0, vPadding: 0)
//        .background(.fill.tertiary)
//        .clipShape(Circle())
    }
}

// MARK: 搜索view

private struct MusicSearchView: View {
    @State var searchWord = ""

    init(searchWord: String = "") {
        self.searchWord = searchWord
    }

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "magnifyingglass")
                .opacity(0.8)
            TextField("搜索", text: $searchWord)
                .font(.title)
                .frame(width: 180)
                .padding(.trailing, 8)
                .hoverEffectDisabled()
        }
        .padding(5)
        .background(.fill.tertiary)
        .clipShape(Capsule())
        .hoverCapsuleEffect()
    }
}

#Preview {
    MusicTopBarRightView()
}
