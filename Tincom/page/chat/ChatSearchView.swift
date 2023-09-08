//
//  SearchView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/11.
//

import SwiftUI

// MARK: 聊天搜索view

struct ChatSearchView: View {
    @State private var searchWord: String = "" // 直接在结构体内部定义 @State 属性

    @State private var submit: (_ keyword: String) -> Void

    init(_ submit: @escaping (_: String) -> Void) { // 不需要传入 searchWord
        self.submit = submit
    }

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .opacity(0.5)
            TextField("搜索", text: $searchWord)
                .onSubmit {
                    submit(searchWord)
                }
                .font(.system(size: 20))
                .frame(maxWidth: .infinity)
                .hoverEffectDisabled()
        }
        .padding(8)
        .frame(height: 50)
        .background(
            Capsule().fill(.black.opacity(0.15))
        )
        .hoverCapsuleEffect()
    }
}

#Preview {
    ChatSearchView {_ in }
}
