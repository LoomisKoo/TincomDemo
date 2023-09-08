//
//  GameVideoBottomDecorator.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/3.
//

import SwiftUI

// MARK: 游戏视频下方信息栏

struct GameVideoBottomBar: View {
    private let iconSize: CGFloat = 45

    @Binding var isStartAnimation: Bool

    @State private var isShow = false

    init(_ isStartAnimation: Binding<Bool>) {
        _isStartAnimation = isStartAnimation
    }

    var body: some View {
//        let rotation: CGFloat = isShow ? 0 : 140

        HStack(spacing: 30) {
            /// 左边队伍英雄信息
            LeftInfoView(iconSize)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue)
                        .blur(radius: 300)
                )

            /// 右边队伍英雄信息
            RightInfoView(iconSize)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .blur(radius: 200)
                )
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
        .padding(.bottom, 50)
//        .rotation3DEffect(
//            Angle(degrees: rotation),
//            axis: (x: 1.0, y: 0.0, z: 0.0)
//        )
//        .scaleEffect(x: isShow ? 1 : 0)
        .offset(y: isShow ? 0 : 50)
        .opacity(isShow ? 1 : 0)
        .onChange(of: isStartAnimation) { _, newValue in
            withAnimation {
                isShow = newValue
            }
        }
    }
}

// MARK: 左边英雄信息类view

private struct LeftInfoView: View {
    private let iconSize: CGFloat

    private let heroListInfo: [GameHeroInfoData] = GameVideoVM().getBlueTeamList()

    init(_ iconSize: CGFloat) {
        self.iconSize = iconSize
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                /// 英雄战绩icon
                HeroStatsIconView()
                    .padding(.leading, 65)

                /// 经济icon
                Image("ic_hero_stats_economy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 33)
            }

            /// 各英雄信息
            ForEach(heroListInfo, id: \.self) { info in
                ItemView(iconSize, info)
            }
        }
    }

    // 每一行View
    private struct ItemView: View {
        private let iconSize: CGFloat

        private let heroInfo: GameHeroInfoData

        init(_ iconSize: CGFloat, _ heroInfo: GameHeroInfoData) {
            self.iconSize = iconSize
            self.heroInfo = heroInfo
        }

        var body: some View {
            HStack {
                ZStack(alignment: .bottomLeading) {
                    /// 英雄头像
                    Image(heroInfo.heroAvatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize * 1.2)
                        .clipShape(Circle())
                        .padding(1) /// 边框
                        .background(Color.yellow.blur(radius: 20))
                        .clipShape(Circle())

                    /// 英雄等级
                    Text("\(heroInfo.level)")
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.black)
                                .frame(width: 15)
                                .blur(radius: 15.0)
                        )
                }

                /// 英雄战绩
                HStack(spacing: 0) {
                    /// 击杀
                    Text("\(heroInfo.kills)")
                        .frame(width: 40)
                    Text("/")
                    /// 死亡
                    Text("\(heroInfo.deaths)")
                        .frame(width: 40)
                    Text("/")
                    /// 助攻
                    Text("\(heroInfo.assists)")
                        .frame(width: 40)
                }
                .font(.system(size: 20))

                /// 英雄经济
                Text(formatNumber(heroInfo.economy))
                    .font(.system(size: 20))
                    .frame(width: 60)

                /// 英雄出装
                HStack(spacing: 5) {
                    ForEach(heroInfo.equipmentList, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: iconSize)
                            .clipShape(Circle())
                            .padding(1) /// 边框
                            .background(Color.yellow.blur(radius: 20))
                            .clipShape(Circle())
                    }
                }
            }
        }

        func formatNumber(_ number: Int) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = ""
            return formatter.string(from: NSNumber(value: number)) ?? ""
        }
    }
}

// MARK: 右边英雄信息view

private struct RightInfoView: View {
    private let iconSize: CGFloat

    private let heroListInfo: [GameHeroInfoData] = GameVideoVM().getRedTeamList()

    init(_ iconSize: CGFloat) {
        self.iconSize = iconSize
    }

    var body: some View {
        VStack(alignment: .trailing) {
            HStack(spacing: 0) {
                /// 经济icon
                Image("ic_hero_stats_economy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 32)

                /// 战绩icon
                HeroStatsIconView()
                    .padding(.trailing, 65)
            }

            /// 各英雄信息
            ForEach(heroListInfo, id: \.self) { info in
                ItemView(iconSize, info)
            }
        }
    }

    /// 每一行view
    private struct ItemView: View {
        private let iconSize: CGFloat
        private let heroInfo: GameHeroInfoData

        init(_ iconSize: CGFloat, _ heroInfo: GameHeroInfoData) {
            self.iconSize = iconSize
            self.heroInfo = heroInfo
        }

        var body: some View {
            HStack {
                HStack(spacing: 5) {
                    /// 英雄出装
                    ForEach(heroInfo.equipmentList, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: iconSize)
                            .clipShape(Circle())
                            .padding(1) /// 边框
                            .background(Color.yellow.blur(radius: 20))
                            .clipShape(Circle())
                    }
                }

                /// 英雄经济
                Text(formatNumber(heroInfo.economy))
                    .font(.system(size: 20))
                    .frame(width: 60)

                /// 英雄战绩
                HStack(spacing: 0) {
                    /// 击杀
                    Text("\(heroInfo.kills)")
                        .frame(width: 40)
                    Text("/")
                    /// 死亡
                    Text("\(heroInfo.deaths)")
                        .frame(width: 40)
                    Text("/")
                    /// 助攻
                    Text("\(heroInfo.assists)")
                        .frame(width: 40)
                }.font(.system(size: 20))

                ZStack(alignment: .bottomTrailing) {
                    /// 英雄头像
                    Image(heroInfo.heroAvatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize * 1.2)
                        .clipShape(Circle())
                        .padding(1) /// 边框
                        .background(Color.yellow.blur(radius: 20))
                        .clipShape(Circle())

                    /// 英雄等级
                    Text("\(heroInfo.level)")
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.black)
                                .frame(width: 15)
                                .blur(radius: 15.0)
                        )
                }
            }
        }

        func formatNumber(_ number: Int) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = ""
            return formatter.string(from: NSNumber(value: number)) ?? ""
        }
    }
}

// MARK: 英雄战绩icon(杀敌、死亡、助攻)

private struct HeroStatsIconView: View {
    var body: some View {
        HStack(spacing: 5) {
            Image("ic_hero_stats_kills")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 20)

            Image("ic_hero_stats_deaths")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 20)

            Image("ic_hero_stats_assists")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 20)
        }
    }
}

#Preview {
    GameVideoBottomBar(.constant(true))
}
