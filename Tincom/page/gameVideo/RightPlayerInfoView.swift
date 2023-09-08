//
//  RightPlayerInfoView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/4.
//

import SwiftUI

// MARK: 右边玩家数据

struct RightPlayerInfoView: View {
    /// view的下标 用于控制view的动画延迟
    private var index: Int

    /// 外部控制是否显示或者隐藏
    @Binding var onShowEvent: Bool

    /// 选手、英雄信息
    @State private var playerInfo: GameHeroInfoData

    /// 用于显示或隐藏的动画
    @State private var isShow = false

    init(index: Int, onShowEvent: Binding<Bool>, playerInfo: GameHeroInfoData) {
        self.index = index
        _onShowEvent = onShowEvent
        self.playerInfo = playerInfo
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack {
                /// 英雄头像、等级、选手昵称
                VStack(alignment: .trailing, spacing: 10) {
                    ZStack(alignment: .bottomTrailing) {
                        /// 英雄头像
                        Image(playerInfo.heroAvatar)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(1) /// 边框
                            .background(Color.yellow.blur(radius: 20))
                            .clipShape(Circle())

                        /// 英雄等级
                        Text("\(playerInfo.level)")
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 15)
                                    .blur(radius: 15.0)
                            )
                    }

                    /// 选手昵称
                    Text(playerInfo.playerName)
                        .font(.title2)
                }
                .padding(.vertical, 10)

                Spacer().frame(width: 130)
            }
            .padding(.leading, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .blur(radius: 50)
                    .opacity(0.3)
            )
            .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))

            /// 选手头像、技能
            ZStack(alignment: .bottomTrailing) {
                /// 选手头像
                Image(playerInfo.playerAvatar)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .cornerRadius(10)

                /// 技能
                Image(playerInfo.skill)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(1.5) /// 边框
                    .background(Color.yellow.blur(radius: 20))
                    .clipShape(Circle())
                    .padding(10) /// 边距
            }
            .frame(depth: 10)
        }
        .offset(x: isShow ? 0 : 100)
        .opacity(isShow ? 1 : 0)
        .padding(.trailing, 100) // 预留空间给退出动画
        .padding(.leading, 10) // 预留一点边界给回弹动画
        .onChange(of: onShowEvent) { _, newValue in
            withAnimation(Animation.bouncy(duration: 0.6).delay(Double(index) * 0.04)) {
                isShow = newValue
            }
        }
    }
}

#Preview {
    let player = GameVideoVM().getRedTeamList()[0]
    return RightPlayerInfoView(index: 0, onShowEvent: .constant(false), playerInfo: player)
}
