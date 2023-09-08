//
//  TextMsgViewRight.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/13.
//

import SwiftUI

// MARK: 右边文本消息view

struct TextMsgViewRight: View {
    private let msg: String

    init(msg: String) {
        self.msg = msg
    }

    var body: some View {
        HStack {
            Spacer()

            Text(msg)
                .font(.title3)
                .padding(14)
                .background(Color(hex: 0x57B369))
                .hoverRadiusEffect(8)
                .cornerRadius(8)
                .frame(maxWidth: 500, alignment: .trailing)

            Image("ic_my_avatar")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .hoverRadiusEffect(10)
        }
        .padding()
    }
}

#Preview {
    TextMsgViewRight(msg: "test msg")
}
