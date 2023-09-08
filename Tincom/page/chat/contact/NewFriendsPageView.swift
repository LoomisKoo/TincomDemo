//
//  NewFriendPageView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/8/14.
//

import SwiftUI

// MARK: 新朋友页面

struct NewFriendsPageView: View {
    @State private var contactInfo = [ContactInfoData]()
    @State private var selectedContact: ContactInfoData?

    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                /// 联系人列表
                LazyVStack(spacing: 5) {
                    ForEach(contactInfo, id: \.self) { info in
                        NewFriendItemView(contactInfo: info, selectedContact: $selectedContact)
                    }
                }
                .padding(.top, 10)
                .frame(width: 380)
            }

            Divider()

            /// 联系人详情
            ContactDetailsView(selectedContact)
                .frame(width: 500)
                .frame(maxWidth: .infinity)
        }
        .onAppear {
            contactInfo = ContactViewModel().fetcheRecentlyContect()
//            selectedContact = contactInfo.first
        }
    }
}

// MARK: 新联系人item

private struct NewFriendItemView: View {
    private let contactInfo: ContactInfoData
    @Binding var selectedContact: ContactInfoData?

    init(
        contactInfo: ContactInfoData,
        selectedContact: Binding<ContactInfoData?>
    ) {
        self.contactInfo = contactInfo
        _selectedContact = selectedContact
    }

    var body: some View {
        HStack {
            /// 头像
            Image(contactInfo.personalInfo.avatarUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                HStack {
                    /// 昵称
                    Text(contactInfo.personalInfo.nickName)
                        .font(.title)

                    Spacer()

                    /// 添加状态
                    Text("已添加")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.7))
                }

                Spacer()

                /// 打招呼内容
                Text("打招呼内容")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(1)
            }
        }
        .padding(10)
        .padding(.trailing, 10)
        .hoverRadiusEffect(20)
        .background(contactInfo == selectedContact ? Color.black.opacity(0.3) : Color.clear)
        .cornerRadius(20)
        .padding(.horizontal, 10)
        .onTapGesture {
            selectedContact = contactInfo
        }
    }
}

#Preview {
    NewFriendsPageView()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
