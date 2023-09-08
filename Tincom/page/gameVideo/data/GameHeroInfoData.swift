//
//  GamePlayerInfoData.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/4.
//

import Foundation

// MARK: 游戏玩家/角色资料

struct GameHeroInfoData: Hashable {
    let teamName: String /// 队名
    let playerAvatar: String /// 玩家头像本地资源名
    let playerName: String /// 玩家姓名

    let heroAvatar: String /// 英雄头像本地资源名
    let level: Int /// 等级
    let skill: String /// 技能

    let blood: Int /// 血量
    let economy: Int /// 经济

    let kills: Int ///  击杀
    let deaths: Int /// 死亡
    let assists: Int /// 助攻

    /// 6装备本地图片名
    let equipmentList: [String]

    init(
        teamName: String,
        playerAvatar: String,
        playerName: String,
        heroAvatar: String,
        level: Int,
        skill: String,
        blood: Int,
        economy: Int,
        kills: Int,
        deaths: Int,
        assists: Int,
        equipmentList: [String]
    ) {
        self.teamName = teamName
        self.playerAvatar = playerAvatar
        self.playerName = playerName
        self.heroAvatar = heroAvatar
        self.level = level
        self.skill = skill
        self.blood = blood
        self.economy = economy
        self.kills = kills
        self.deaths = deaths
        self.assists = assists
        self.equipmentList = equipmentList
    }
}
