//
//  NoticeBubbleView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/11.
//

import SwiftUI

// MARK: 未读消息view

struct NoticeBubbleView: View {
    /// 消息数量
    private var contactInfo: ContactInfoData

    init(contactInfo: ContactInfoData) {
        self.contactInfo = contactInfo
    }

    var body: some View {
        /// 免打扰
        if contactInfo.personalInfo.isNoDisturb {
            Text("")
                .frame(width: 15, height: 15)
                .background(Color.red)
                .clipShape(Circle())
                .padding(.top, -5)
                .padding(.trailing, -5)
                .opacity(opacity())
        } else {
            Text(getMsg())
                .padding(.horizontal, 5)
                .frame(height: 22)
                .frame(minWidth: 22)
                .background(Color.red)
                .clipShape(Capsule())
                .padding(.top, -7)
                .padding(.trailing, -7)
                .opacity(opacity())
        }
    }

    /// 如果没有消息则不显示
    private func opacity() -> Double {
        return contactInfo.unreadCount > 0 ? 1 : 0
    }

    private func getMsg() -> String {
        return contactInfo.unreadCount > 99 ? "···" : String(contactInfo.unreadCount)
    }
}

#Preview {
    NoticeBubbleView(contactInfo: ContactViewModel().fetcheRecentlyContect().last!)
}
