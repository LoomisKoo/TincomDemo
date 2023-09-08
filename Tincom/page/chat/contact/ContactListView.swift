//
//  ContactListView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/8/13.
//

import SwiftUI

// MARK: 联系人列表

struct ContactListView: View {
    /// 当前选中的导航（菜单）类型
    @State private var curNaviType = ContactNaviType.newFriends

    var body: some View {
        HStack(spacing: 0) {
            ContactListNavigationView($curNaviType)
                .frame(width: 380)
                .background(Color.black.opacity(0.1))

            switch curNaviType {
            /// 新朋友列表页面
            case .newFriends: NewFriendsPageView()
            /// 群聊列表页面
            case .groupChat: GroupChatPageView()
            /// 联系人列表页面
            case .friends: FriendsPageView()
            }
        }
    }
}

// MARK: 联系人导航（菜单）类型

enum ContactNaviType: Observable {
    case newFriends
    case groupChat
    case friends
}

// MARK: 通讯录导航栏

struct ContactListNavigationView: View {
    @Binding var curNaviType: ContactNaviType

    init(_ curNaviType: Binding<ContactNaviType>) {
        _curNaviType = curNaviType
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            /// 头部-通讯录管理 按钮
            header()

            Spacer().frame(height: 10)

            NaviItemView(
                icon: "person.badge.plus",
                title: "新朋友(7)",
                curItem: .newFriends,
                selectedItem: $curNaviType
            )
            
            NaviItemView(
                icon: "rectangle.3.group.bubble.left",
                title: "群聊(20)",
                curItem: .groupChat,
                selectedItem: $curNaviType
            )
            
            NaviItemView(
                icon: "person",
                title: "联系人(99)",
                curItem: .friends,
                selectedItem: $curNaviType
            )
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(25)
    }

    /// 通讯录管理 按钮
    private func header() -> some View {
        return Button(action: {}, label: {
            Label(
                title: { Text("通讯录管理").font(.title) },
                icon: {
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            )
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .hoverRadiusEffect(10)
    }
}

// MARK: 导航菜单

private struct NaviItemView: View {
    private let icon: String
    private let title: String
    private let curItem: ContactNaviType
    @Binding var selectedItem: ContactNaviType

    init(
        icon: String,
        title: String,
        curItem: ContactNaviType,
        selectedItem: Binding<ContactNaviType>
    ) {
        self.icon = icon
        self.title = title
        self.curItem = curItem
        _selectedItem = selectedItem
    }

    var body: some View {
        Button(action: {
            selectedItem = curItem
        }, label: {
            Label(
                title: { Text(title).font(.title) },
                icon: { Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                }
            )
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        })
        .hoverRadiusEffect(10)
        .background(selectedItem == curItem ? Color.gray.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
}

#Preview {
    ContactListView()
        .glassBackgroundEffect()
}
