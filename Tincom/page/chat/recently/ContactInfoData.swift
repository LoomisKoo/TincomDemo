//
//  ContactInfoData.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/12.
//

import Foundation

// MARK: 联系人聊天信息

@Observable
class ContactInfoData: Hashable {
    static func == (lhs: ContactInfoData, rhs: ContactInfoData) -> Bool {
        lhs.personalInfo.chatId == rhs.personalInfo.chatId
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(personalInfo.chatId)
    }

    let personalInfo: PeronalInfoData /// 联系人信息
    var msgList: [MessageData] = [] /// 消息数组
    var unreadCount: Int = 0 /// 未读消息数

    init(personalInfo: PeronalInfoData, msgList: [MessageData], unreadCount: Int) {
        self.personalInfo = personalInfo
        self.msgList = msgList
        self.unreadCount = unreadCount
    }

    // 获取最后一条消息
    func getLastMsg() -> MessageData? {
        var sortedMsgList = msgList
        sortedMsgList.sort { msg1, msg2 in
            msg1.time < msg2.time
        }

        return sortedMsgList.last
    }
}

// MARK: 联系人消息

struct MessageData: Hashable {
    let type: MessageType /// 消息类型
    let time: Int64 /// 消息发送的时间戳
    let state: MessageState /// 消息状态
    let senderId: String /// 发送者id
    let msgText: String /// 消息内容

    func getConvertTime() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

// MARK: 消息类型

enum MessageType {
    case text // 纯文本
    case image // 图片
    case voice // 语音
    case video // 视频
    case file // 文件
    case time // 时间
    case other // 其他
}

// MARK: 消息状态

enum MessageState {
    case sent // 已发送
    case failure // 发送失败
    case sending // 发送中
}

// MARK: 联系人信息

struct PeronalInfoData: Hashable {
    let nickName: String /// 昵称
    let avatarUrl: String /// 头像url
    let chatId: String /// id
    let region: String /// 地区
    let mark: String /// 备注
    let sign: String /// 个性签名
    let sex: PersonalSex /// 性别
    let isNoDisturb: Bool /// 是否免打扰
}

// MARK: 性别

enum PersonalSex {
    case male // 男性
    case female // 女性
}
