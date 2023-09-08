//
//  TextMsgViewLeft.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/8/13.
//

import SwiftUI

// MARK: 左边文本消息view

struct TextMsgViewLeft: View {
    private let msg: String
    private let avatar: String

    init(msg: String, avatar: String) {
        self.msg = msg
        self.avatar = avatar
    }

    var body: some View {
        HStack {
            Image(avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .hoverRadiusEffect(8)

            Text(msg)
                .font(.title3)
                .padding(14)
                .background(Color(hex: 0x2C2C2C))
                .hoverRadiusEffect(8)
                .cornerRadius(8)
                .frame(maxWidth: 500, alignment: .leading)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()

        Spacer()
    }
}

#Preview {
    TextMsgViewLeft(msg: "test msg", avatar: "ic_my_avatar")
        .glassBackgroundEffect()
}
