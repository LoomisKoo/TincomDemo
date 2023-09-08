//
//  ContactDetailsView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/8/15.
//

import SwiftUI

// MARK: 联系人详细信息

struct ContactDetailsView: View {
    private let contactInfo: ContactInfoData?

    init(_ contactInfo: ContactInfoData?) {
        self.contactInfo = contactInfo
    }

    var body: some View {
        if let personalInfo = contactInfo?.personalInfo {
            VStack(alignment: .leading, spacing: 10) {
                /// 头像等信息
                header(personalInfo)
                Divider()

                /// 备注
                mark(personalInfo)
                Divider()

                /// 朋友圈
                friendCircle()
                Divider()

                /// 群聊、签名、来源
                baseInfo(personalInfo)
                Divider()

                /// 发消息、语音通话、视频通话
                connect()
                Spacer()
            }
            .padding()
            .padding(.top, 50)
            .frame(maxWidth: .infinity, alignment: .top)
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

    /// 头像、昵称、性别等信息
    private func header(_ personalInfo: PeronalInfoData) -> some View {
        return HStack(alignment: .top) {
            /// 头像
            Image(personalInfo.avatarUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .hoverRadiusEffect(10)

            VStack(alignment: .leading) {
                HStack {
                    let name = personalInfo.mark.isEmpty ? personalInfo.nickName : personalInfo.mark

                    /// 备注或者昵称（优先显示备注）
                    Text(name)
                        .font(.largeTitle)

                    Group {
                        /// 性别
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(personalInfo.sex == PersonalSex.male ? Color.blue : Color.red)

                        /// 是否加星
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.green)
                    }
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                }

                Group {
                    /// 昵称
                    Text("昵称：\(personalInfo.nickName)")
                        .padding(.top, 1)
                    /// id
                    Text("id：chocokoo")
                    /// 地区
                    Text("地区：\(personalInfo.region)")
                }
                .bold()
                .font(.title3)
                .foregroundColor(.white.opacity(0.8))
            }

            Spacer()

            /// 更多
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(15)
                .hoverCircleEffect()
                .offset(y: -10)
        }
    }

    /// 朋友圈
    private func mark(_ personalInfo: PeronalInfoData) -> some View {
        return HStack {
            Text("备注")
                .foregroundColor(.white.opacity(0.6))

            if personalInfo.mark.isEmpty {
                Text("添加备注名")
                    .padding(.leading, 70)
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
            } else {
                Text(personalInfo.mark)
                    .padding(.leading, 70)
                    .font(.title3)
            }
        }
    }

    private func friendCircle() -> some View {
        return HStack {
            Text("朋友圈")
                .foregroundColor(.white.opacity(0.8))

            HStack(spacing: 5) {
                Group {
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                }
                .frame(width: 50, height: 50)
                .background(Color.black.opacity(0.5))
            }
            .padding(.leading, 50)
        }
    }

    /// 群聊、签名、来源
    private func baseInfo(_ personalInfo: PeronalInfoData) -> some View {
        return
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("共同群聊")
                        .foregroundColor(.white.opacity(0.8))
                    Text("0个")
                        .padding(.leading, 35)
                        .font(.title3)
                }

                HStack {
                    Text("个性签名")
                        .foregroundColor(.white.opacity(0.8))
                    Text(personalInfo.sign)
                        .padding(.leading, 35)
                        .font(.title3)
                }
                HStack {
                    Text("来源")
                        .foregroundColor(.white.opacity(0.8))
                    Text("通过扫一扫")
                        .padding(.leading, 70)
                        .font(.title3)
                }
            }
    }

    /// 发起联系
    private func connect() -> some View {
        return HStack {
            VStack {
                Image(systemName: "bubble.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text("发消息").font(.title3)
            }
            .frame(width: 100, height: 100)
            .hoverRadiusEffect(10)

            VStack {
                Image(systemName: "phone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text("语音通话").font(.title3)
            }
            .frame(width: 100, height: 100)
            .hoverRadiusEffect(10)

            VStack {
                Image(systemName: "video")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text("视频通话").font(.title3)
            }
            .frame(width: 100, height: 100)
            .hoverRadiusEffect(10)
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContactDetailsView(ContactViewModel().fetcheRecentlyContect().first)
}
