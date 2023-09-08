//
//  FunctionButton.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/13.
//

import Foundation
import SwiftUI

// MARK: 聊天的功能按钮

struct ChatFunctionButton: View {
    private let systemName: String
    private let onClick: () -> Void

    init(_ systemName: String, _ onClick: @escaping () -> Void) {
        self.systemName = systemName
        self.onClick = onClick
    }

    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .foregroundColor(.white.opacity(0.8))
            .frame(width: 25, height: 25)
            .padding(10)
            .hoverCircleEffect()
            .padding(.horizontal, 5)
            .onTapGesture {
                onClick()
            }
    }
}
