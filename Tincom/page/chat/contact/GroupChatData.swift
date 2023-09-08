//
//  GroupChatData.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/8/16.
//

import Foundation

// MARK: 群聊data

struct GroupChatData: Hashable {
    let groupName: String // 群名称
    let groupMark: String // 群备注
    let memberList: [PeronalInfoData] // 群成员id数组
    let isNotDisturb: Bool // 是否免打扰
    let messageList: [MessageData]? // 消息数组
    let isPinned: Bool // 群是否置顶
    let announcement: String? // 群公告
}
