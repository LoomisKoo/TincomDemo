//
//  MyInfomationView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/11.
//

import SwiftUI

// MARK: 顶部个人信息view

struct MyInfomationView: View {
    var body: some View {
        HStack {
            /// 本人头像
            Image("ic_my_avatar")
                .resizable()
                .frame(width: 85, height: 85)
                .clipShape(Circle())
                .hoverCircleEffect()

            VStack(alignment: .leading, spacing: 10) {
                /// 本人昵称
                Text("LoomisKoo")
                    .font(.largeTitle)
                    .opacity(0.6)

                /// 账号ID
                Text("ID:chocokoo")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MyInfomationView()
        .glassBackgroundEffect()
}
