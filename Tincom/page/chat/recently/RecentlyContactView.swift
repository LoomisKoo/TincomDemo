//
//  RecentlyContactView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/10.
//

import SwiftUI

// MARK: 最近联系人

struct RecentlyContactView: View {
    /// 联系人列表
    @State var contactList = [ContactInfoData]()

    /// 选中的联系人(对话对象)id
    @State var selectedContact: ContactInfoData? = nil

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                /// 个人信息
                MyInfomationView()

                /// 最近联系人列表
                RecentlyContactListView(contactList: $contactList, selectedContact: $selectedContact)
            }
            .frame(width: 380)
            .background(Color.black.opacity(0.1))

            /// 对话窗口
            ChatWindowView(selectedContact: $selectedContact)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            contactList = ContactViewModel().fetcheRecentlyContect()
            selectedContact = contactList.first
        }

            
//        .ornament(attachmentAnchor: .scene(.topTrailing)) {
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
    RecentlyContactView()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
