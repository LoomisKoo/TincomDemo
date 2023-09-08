//
//  ContactViewModel.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/8/12.
//

import Foundation

// MARK: 联系人vm

class ContactViewModel {
    /*
     加载最近联系人列表
     */
    func fetcheRecentlyContect() -> [ContactInfoData] {
        let myChatId = "0"
        let info1 = PeronalInfoData(nickName: "张学友", avatarUrl: "ic_avatar_xueyou", chatId: "Jacky Cheung", region: "中国香港", mark: "学友", sign: "食饭啦你", sex: .male, isNoDisturb: false)
        let messageList1 = [
            MessageData(type: .text, time: 1691693840, state: .sent, senderId: info1.chatId, msgText: "下次请一定要来看我的演唱会"),
        ]

        let info2 = PeronalInfoData(nickName: "周杰伦", avatarUrl: "ic_avatar_jielun", chatId: "JayChow", region: "中国台湾", mark: "", sign: "哎哟~不错哦", sex: .male, isNoDisturb: false)
        let messageList2 = [
            MessageData(type: .text, time: 1691703841, state: .sent, senderId: info2.chatId, msgText: "这位选手请介绍一下你自己"),
        ]
        let info3 = PeronalInfoData(nickName: "李健", avatarUrl: "ic_avatar_lijian", chatId: "JianLee", region: "中国大陆", mark: "", sign: "爱情自有天意", sex: .male, isNoDisturb: false)
        let messageList3 = [
            MessageData(type: .text, time: 1691713840, state: .sent, senderId: info3.chatId, msgText: "爱自有天意"),
        ]
        let info4 = PeronalInfoData(nickName: "周星驰", avatarUrl: "ic_avatar_zhouxingchi", chatId: "StephenChow", region: "中国香港", mark: "星爷", sign: "一万年太久，只争朝夕", sex: .male, isNoDisturb: false)
        let messageList4 = [
            MessageData(type: .text, time: 1691653839, state: .sent, senderId: info4.chatId, msgText: "不上班行不行？"),
            MessageData(type: .text, time: 1691653840, state: .sent, senderId: myChatId, msgText: "不上班你养我啊？"),
            MessageData(type: .text, time: 1691653841, state: .sent, senderId: info4.chatId, msgText: "我养你啊"),
            MessageData(type: .text, time: 1691653841, state: .sent, senderId: myChatId, msgText: "你先养好你自己吧，傻瓜"),
        ]
        let info5 = PeronalInfoData(nickName: "费翔", avatarUrl: "ic_avatar_feixiang", chatId: "Phillips", region: "美国", mark: "", sign: "你就像冬天里的一把火", sex: .male, isNoDisturb: false)
        let messageList5 = [
            MessageData(type: .text, time: 1691773841, state: .sent, senderId: info5.chatId, msgText: "马看到什么，是run决定的"),
        ]
        let info6 = PeronalInfoData(nickName: "马云", avatarUrl: "ic_avatar_mayun", chatId: "Jack", region: "中国大陆", mark: "马爸爸", sign: "我对钱没兴趣", sex: .male, isNoDisturb: false)
        let messageList6 = [
            MessageData(type: .text, time: 1691703641, state: .sent, senderId: info6.chatId, msgText: "来打高尔夫，我私人飞机接你"),
        ]
        let info7 = PeronalInfoData(nickName: "马化腾", avatarUrl: "ic_avatar_mahuateng", chatId: "Pony", region: "中国大陆", mark: "", sign: "融不到一分钱也要做事业", sex: .male, isNoDisturb: false)
        let messageList7 = [
            MessageData(type: .text, time: 1691703840, state: .sent, senderId: info7.chatId, msgText: "公司多少钱，你开个价"),
        ]

        var list = [
            ContactInfoData(personalInfo: info1, msgList: messageList1, unreadCount: 10),
            ContactInfoData(personalInfo: info2, msgList: messageList2, unreadCount: 22),
            ContactInfoData(personalInfo: info3, msgList: messageList3, unreadCount: 111),
            ContactInfoData(personalInfo: info4, msgList: messageList4, unreadCount: 0),
            ContactInfoData(personalInfo: info5, msgList: messageList5, unreadCount: 2),
            ContactInfoData(personalInfo: info6, msgList: messageList6, unreadCount: 0),
            ContactInfoData(personalInfo: info7, msgList: messageList7, unreadCount: 1),
        ]

        // 根据时间排序
        list.sort(by: { item1, item2 in
            if let time1 = item1.msgList.first?.time,
               let time2 = item2.msgList.first?.time {
                return time1 < time2
            }
            return false
        })

        return list
    }

    // MARK: 加载所有联系人数据

    func fetchAllContect() {
    }

    // MARK: 加载所有群聊数据

    func fetchGroupData() -> [GroupChatData] {
        let info1 = PeronalInfoData(nickName: "张学友", avatarUrl: "ic_avatar_xueyou", chatId: "Jacky Cheung", region: "中国香港", mark: "学友", sign: "食饭啦你", sex: .male, isNoDisturb: false)

        let info2 = PeronalInfoData(nickName: "周杰伦", avatarUrl: "ic_avatar_jielun", chatId: "JayChow", region: "中国台湾", mark: "", sign: "哎哟~不错哦", sex: .male, isNoDisturb: false)

        let info3 = PeronalInfoData(nickName: "李健", avatarUrl: "ic_avatar_lijian", chatId: "JianLee", region: "中国大陆", mark: "", sign: "爱情自有天意", sex: .male, isNoDisturb: false)

        let info4 = PeronalInfoData(nickName: "周星驰", avatarUrl: "ic_avatar_zhouxingchi", chatId: "StephenChow", region: "中国香港", mark: "星爷", sign: "一万年太久，只争朝夕", sex: .male, isNoDisturb: false)

        let info5 = PeronalInfoData(nickName: "费翔", avatarUrl: "ic_avatar_feixiang", chatId: "Phillips", region: "美国", mark: "", sign: "你就像冬天里的一把火", sex: .male, isNoDisturb: false)

        let info6 = PeronalInfoData(nickName: "马云", avatarUrl: "ic_avatar_mayun", chatId: "Jack", region: "中国大陆", mark: "马爸爸", sign: "我对钱没兴趣", sex: .male, isNoDisturb: false)

        let info7 = PeronalInfoData(nickName: "马化腾", avatarUrl: "ic_avatar_mahuateng", chatId: "Pony", region: "中国大陆", mark: "", sign: "融不到一分钱也要做事业", sex: .male, isNoDisturb: false)

        let menberList1 = [info1, info2]
        let menberList2 = [info6, info7]
        let menberList3 = [info1, info2, info3]
        let menberList4 = [info2, info4, info5]

        return [
            GroupChatData(groupName: "VisionPro 交流群", groupMark: "", memberList: menberList1, isNotDisturb: false, messageList: nil, isPinned: true, announcement: nil),
            GroupChatData(groupName: "互联网 交流群", groupMark: "", memberList: menberList2, isNotDisturb: false, messageList: nil, isPinned: true, announcement: nil),
            GroupChatData(groupName: "华语乐坛 交流群", groupMark: "", memberList: menberList3, isNotDisturb: false, messageList: nil, isPinned: true, announcement: nil),
            GroupChatData(groupName: "港台影视 交流群", groupMark: "", memberList: menberList4, isNotDisturb: false, messageList: nil, isPinned: true, announcement: nil),
        ]
    }

    func getMessage(text: String) -> MessageData {
        let time = Date().timeIntervalSince1970
        return MessageData(type: .text, time: Int64(time), state: .sent, senderId: "0", msgText: text)
    }
}
