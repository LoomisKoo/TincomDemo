//
//  GroupChatPageView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/8/14.
//

import SwiftUI

// MARK: 联系人-群聊列表页面

struct GroupChatPageView: View {
    // 群列表数据
    @State private var groupList = [GroupChatData]()
    @State private var selectedGroup: GroupChatData?

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(groupList, id: \.self) { data in
                        GroupItemView(groupData: data, selectedGroup: $selectedGroup)
                    }
                }
                .padding(.top, 10)
            }
            .frame(width: 380)

            Divider()

            GroupDetailsView(selectedGroup: $selectedGroup)
                .frame(width: 400)
                .frame(maxWidth: .infinity)
        }
        .onAppear {
            groupList = ContactViewModel().fetchGroupData()
        }
    }
}

// MARK: 群详情

private struct GroupDetailsView: View {
    @State private var notDisturb = true
    @State private var foldGroup = true

    @Binding var selectedGroup: GroupChatData?

    init(selectedGroup: Binding<GroupChatData?>) {
        _selectedGroup = selectedGroup
    }

    var body: some View {
        if let selectedGroup {
            VStack {
                GroupAvatarView(personalList: selectedGroup.memberList, itemSize: 45)

                Text(selectedGroup.groupName)
                    .font(.largeTitle)
                    .padding()

                Group {
                    Toggle(isOn: $notDisturb, label: {
                        Text("消息免打扰")
                            .foregroundColor(Color.white.opacity(0.8))
                    })

                    Divider()

                    Toggle(isOn: $foldGroup, label: {
                        Text("折叠该群聊")
                            .foregroundColor(Color.white.opacity(0.8))
                    })

                    Divider()
                }
                .font(.title2)
                .frame(width: 350)

                Button(action: {}, label: {
                    Text("进入群聊")
                        .font(.title)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color(hex: 0x58BE6A))
                        .cornerRadius(10)
                })
                .hoverRadiusEffect(10)
                .padding(.top, 50)
            }
        } else {
            /// 空布局
            Image(.appLogoFront)
                .resizable()
                .scaledToFit()
                .colorMultiply(.white.opacity(0.14))
                .frame(width: 200, height: 200)
                .frame(maxHeight: .infinity)
        }
    }
}

// MARK: 群item

private struct GroupItemView: View {
    private let groupData: GroupChatData
    @Binding var selectedGroup: GroupChatData?

    init(groupData: GroupChatData, selectedGroup: Binding<GroupChatData?>) {
        self.groupData = groupData
        _selectedGroup = selectedGroup
    }

    var body: some View {
        HStack {
            /// 群头像
            GroupAvatarView(personalList: groupData.memberList, itemSize: 25)

            /// 群名称
            Text(groupData.groupName)
                .font(.largeTitle)

            Spacer()
        }
        .padding(10)
        .background(getBackground())
        .cornerRadius(20)
        .hoverRadiusEffect(20)
        .padding(.horizontal, 10)
        .onTapGesture {
            selectedGroup = groupData
        }
    }

    private func getBackground() -> some View {
        return selectedGroup == groupData ? Color.black.opacity(0.4) : Color.clear
    }
}

// MARK: 群聊九宫格头像

private struct GroupAvatarView: View {
    private let personalList: [PeronalInfoData]
    private let itemSize: CGFloat

    init(personalList: [PeronalInfoData], itemSize: CGFloat) {
        self.personalList = personalList
        self.itemSize = itemSize
    }

    var body: some View {
        VStack(spacing: 3) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 3) {
                    ForEach(0 ..< 3) { column in
                        let index = row * 3 + column
                        if personalList.count > index {
                            if let imageUrl = URL(string: personalList[index].avatarUrl) {
                                Image(imageUrl.absoluteString)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: itemSize, height: itemSize)
                                    .cornerRadius(5)
                            } else {
                                defaultAvatar()
                            }
                        } else {
                            defaultAvatar()
                        }
                    }
                }
            }
        }
        .padding(5)
        .background(.fill.tertiary)
        .cornerRadius(10)
    }

    private func defaultAvatar() -> some View {
//        return Color.clear.frame(width: itemSize, height: itemSize)

        return Image(systemName: "person.fill")
            .resizable()
            .scaledToFit()
            .padding(5)
            .frame(width: itemSize, height: itemSize)
            .background(.fill.tertiary)
            .cornerRadius(5)
    }
}

#Preview {
    GroupChatPageView()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
