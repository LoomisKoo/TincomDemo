//
//  GameVideoTopBarView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/4.
//

import SwiftUI

// MARK: 顶部信息栏

struct GameVideoTopBarView: View {
    /// 红蓝队伍的主色调
    private let blue = Color(red: 0.37, green: 0.66, blue: 0.93)
    private let red = Color(red: 1, green: 0.2, blue: 0.25)

    @Binding var isStartAnimation: Bool

    /// 是否显示该bar
    @State private var isShow = false

    ///  计时（秒）
    @State private var elapsedTime: TimeInterval = 0

    /// 计时器
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    /// 计时字符串
    private var timeString: String {
        let minutes = Int(elapsedTime / 60)
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    init(_ isStartAnimation: Binding<Bool>) {
        _isStartAnimation = isStartAnimation
    }

    var body: some View {
        HStack {
            /// TTG队标
            Image("ic_game_team_ttg")
                .resizable()
                .scaledToFit()
                .colorMultiply(blue) // 设置颜色
                .frame(width: 100, height: 100)
                .padding(.bottom, 8)
                .padding(.leading, 5)

            /// 蓝队经济、塔数
            blueEconomyView()

            /// 蓝队比分
            Text("37")
                .font(.system(size: 60))
                .foregroundColor(blue)
                .bold()

            /// 计时
            VStack(spacing: 5) {
                Text("VS")
                    .font(.title)

                Text(timeString)
                    .font(.body)
            }

            /// 红队比分
            Text("31")
                .font(.system(size: 60))
                .foregroundColor(red)
                .bold()

            /// 红队经济、塔数
            redEconomyView()

            /// DRG队标
            Image("ic_game_team_drg")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .colorMultiply(red)
                .padding(.bottom, 10)
                .padding(.trailing, 5)
        }
        .padding(10)
        .background(Color.white.opacity(0.2))
        .glassBackgroundEffect(in: Capsule())
        .offset(y: isShow ? 0 : -50)
        .opacity(isShow ? 1 : 0)
        .padding(.top, 50)
        .onChange(of: isStartAnimation) { _, newValue in
            withAnimation(Animation.bouncy(duration: 0.6)) {
                isShow = newValue
            }
        }
        .onReceive(timer) { _ in
//            elapsedTime += 1
        }
    }

    /// 蓝队经济、塔数
    private func blueEconomyView() -> some View {
        return
            VStack(spacing: 10) {
                /// 战队名
                Text("广州TTG")
                    .font(.largeTitle)
                    .bold()
                    .opacity(0.7)

                HStack(spacing: 20) {
                    HStack(spacing: 5) {
                        /// 龙图标
                        Image("ic_team_battle_dragon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)

                        /// 龙数量
                        Text("3")
                            .font(.title2)
                    }

                    HStack(spacing: 5) {
                        /// 塔图标
                        Image("ic_team_battle_tower")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 28)
                        /// 塔数量
                        Text("7")
                            .font(.title2)
                    }

                    HStack(spacing: 5) {
                        /// 经济图标
                        Image("ic_team_battle_economy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)

                        /// 经济
                        Text("71.4K")
                            .font(.title2)
                    }

                }.padding(.horizontal, 20)
            }
    }

    /// 红队经济、塔数
    private func redEconomyView() -> some View {
        return
            VStack(spacing: 10) {
                Text("佛山RDG")
                    .font(.largeTitle)
                    .bold()
                    .opacity(0.7)

                HStack(spacing: 20) {
                    HStack(spacing: 5) {
                        /// 经济图标
                        Image("ic_team_battle_economy")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.mint)
                            .frame(width: 30, height: 30)

                        /// 经济
                        Text("65.3K")
                            .font(.title2)
                    }

                    HStack(spacing: 5) {
                        /// 塔图标
                        Image("ic_team_battle_tower")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 29)

                        /// 塔数量
                        Text("6")
                            .font(.title2)
                    }

                    HStack(spacing: 5) {
                        /// 龙图标
                        Image("ic_team_battle_dragon")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.mint)
                            .frame(width: 30, height: 30)

                        /// 龙数量
                        Text("1")
                            .font(.title2)
                    }
                }
            }.padding(.horizontal, 20)
    }
}

#Preview {
    GameVideoTopBarView(.constant(true))
}
