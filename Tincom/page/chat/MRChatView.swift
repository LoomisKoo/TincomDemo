//
//  MRChatView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/9.
//

import SwiftUI

// MARK: MR版聊天view

struct MRChatView: View {
    @State var selectIndex = 1

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        TabView(selection: $selectIndex) {
            /// 最近联系人
            CommonTabItemView(text: "最近联系人", icon: "bubble.left.fill", tag: 1) {
                RecentlyContactView()
            }

            /// 通讯录
            CommonTabItemView(text: "通讯录", icon: selectIndex == 2 ? "person.fill" : "person", tag: 2) {
                ContactListView()
            }

            /// 朋友圈
            CommonTabItemView(text: "朋友圈", icon: "camera.aperture", tag: 3) {
                TimeLineView()
            }
        }
        .glassBackgroundEffect(in: .rect(cornerRadius: 20))
        .ornament(attachmentAnchor: .scene(.top)) {
            ChatTopBarView {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarBackButtonHidden()
//        .ornament(attachmentAnchor: .scene(alignment: .topTrailing)) {
//            /// 群信息
//            Text("test")
//                .font(.extraLargeTitle2)
//                .frame(width: 400, height: 600)
//                .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
//                .padding(.leading, 400)
//                .padding(.top, 600)
//        }
    }
}

#Preview {
    MRChatView()
}
