//
//  InputWindowView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/13.
//

import Foundation
import SwiftUI

// MARK: 输入窗口

struct InputWindowView: View {
    @Binding var inputText: String

    init(inputText: Binding<String>) {
        _inputText = inputText
    }

    var body: some View {
        VStack(spacing: 10) {
            /// 菜单
            HStack(spacing: 0) {
                /// 表情
                ChatFunctionButton("face.smiling.inverse") { }
                /// 文件
                ChatFunctionButton("folder") { }
                /// 语音输入
                ChatFunctionButton("mic") { }
                /// 聊天记录
                ChatFunctionButton("clock") { }

                Spacer()

                /// 电话
                ChatFunctionButton("phone") { }
                /// 视频
                ChatFunctionButton("video") { }
            }
        

            /// 输入框
            TextEditor(text: $inputText)
                .font(.system(size: 25))
                .textEditorStyle(.plain)
                .padding(5)
                .frame(height: 200, alignment: .topLeading)
                .background(.clear)
                .symbolEffectsRemoved()
                .hoverEffectDisabled()
                
        }
        .padding()
    }
}

#Preview {
    InputWindowView(inputText: Binding.constant("input somthing here"))
        .glassBackgroundEffect()
}
