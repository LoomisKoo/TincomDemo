//
//  RecentlyContactListView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/11.
//

import SwiftUI

// MARK: 最近联系人列表

struct RecentlyContactListView: View {
    /// 联系人列表
    @Binding var contactList: [ContactInfoData]

    /// 选中的联系人(对话对象)id
    @Binding var selectedContact: ContactInfoData?

    init(contactList: Binding<[ContactInfoData]>, selectedContact: Binding<ContactInfoData?>) {
        _contactList = contactList
        _selectedContact = selectedContact
    }

    var body: some View {
        /// 联系人列表
        ScrollView {
            LazyVStack(spacing: 5) {
                ForEach(contactList, id: \.personalInfo.chatId) { contact in
                    /// 联系人item
                    ContactView(contactInfo: contact, selectedContact: $selectedContact)
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20) /// 给底部预留空间
            .onChange(of: selectedContact) { _, _ in
                // 选中联系人后，未读消息清零
                selectedContact?.unreadCount = 0
            }
        }
    }
}

// MARK: 联系人Item view

private struct ContactView: View {
    private let contactInfo: ContactInfoData
    @Binding var selectedContact: ContactInfoData?

    init(contactInfo: ContactInfoData, selectedContact: Binding<ContactInfoData?>) {
        self.contactInfo = contactInfo
        _selectedContact = selectedContact
    }

    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                /// 头像
                Image(contactInfo.personalInfo.avatarUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                /// 未读提醒
                NoticeBubbleView(contactInfo: contactInfo)
            }

            VStack(alignment: .leading) {
                HStack {
                    /// 昵称
                    Text(getName())
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    /// 时间
                    Text(getLastMassgeTime())
                        .foregroundColor(.white.opacity(0.6))
                }.padding(.top, 5)

                Spacer()

                /// 最近聊天内容
                Text(getLastMassage())
                    .font(.title3)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.bottom, 5)
            }
        }
        .padding(10)
        .hoverRadiusEffect(20)
        .contentShape(Rectangle()) /// 避免有些空白的地方点击不了
        .background(getBackgroundColor())
        .cornerRadius(20)
        .onTapGesture {
            selectedContact = contactInfo
        }
    }

    /// 获取联系人昵称
    private func getName() -> String {
        return contactInfo.personalInfo.nickName
    }

    /// 获取最后一条信息时间
    private func getLastMassgeTime() -> String {
        if let lastMessage = contactInfo.getLastMsg() {
            return lastMessage.getConvertTime()
        } else {
            return ""
        }
    }

    /// 获取最后一条信息
    private func getLastMassage() -> String {
        return contactInfo.getLastMsg()?.msgText ?? ""
    }

    /// 选中高亮背景
    private func getBackgroundColor() -> Color {
        return selectedContact?.personalInfo.chatId == contactInfo.personalInfo.chatId ? Color.white.opacity(0.1) : Color.clear
    }
}

#Preview {
    let contectList = ContactViewModel().fetcheRecentlyContect()
    return RecentlyContactListView(
        contactList: .constant(contectList),
        selectedContact: .constant(contectList.first)
    )
    .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
