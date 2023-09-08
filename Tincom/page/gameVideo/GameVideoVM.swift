//
//  GameVideoVM.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/5.
//

import Foundation

class GameVideoVM {
    // MARK: 获取蓝队选手信息、英雄信息

    func getBlueTeamList() -> [GameHeroInfoData] {
        let equipmentList1 = ["ic_hero_equipment34", "ic_hero_equipment31", "ic_hero_equipment16", "ic_hero_equipment13", "ic_hero_equipment17", "ic_hero_equipment25"]
        let equipmentList2 = ["ic_hero_equipment7", "ic_hero_equipment33", "ic_hero_equipment28", "ic_hero_equipment14", "ic_hero_equipment24", "ic_hero_equipment22"]
        let equipmentList3 = ["ic_hero_equipment6", "ic_hero_equipment12", "ic_hero_equipment16", "ic_hero_equipment8", "ic_hero_equipment33", "ic_hero_equipment9"]
        let equipmentList4 = ["ic_hero_equipment32", "ic_hero_equipment19", "ic_hero_equipment29", "ic_hero_equipment11", "ic_hero_equipment15", "ic_hero_equipment18"]
        let equipmentList5 = ["ic_hero_equipment20", "ic_hero_equipment17", "ic_hero_equipment26", "ic_hero_equipment19", "ic_hero_equipment24", "ic_hero_equipment16"]

        return [
            GameHeroInfoData(teamName: "广州TTG", playerAvatar: "ic_avatar_ttg_adou", playerName: "阿豆", heroAvatar: "ic_hero_avatar_houyi", level: 19, skill: "ic_hero_skill_frenzy", blood: 1000, economy: 15693, kills: 10, deaths: 4, assists: 7, equipmentList: equipmentList1),

            GameHeroInfoData(teamName: "广州TTG", playerAvatar: "ic_avatar_ttg_qingqing", playerName: "清清", heroAvatar: "ic_hero_avatar_huamulan", level: 15, skill: "ic_hero_skill_flash", blood: 1000, economy: 14419, kills: 7, deaths: 7, assists: 7, equipmentList: equipmentList2),

            GameHeroInfoData(teamName: "广州TTG", playerAvatar: "ic_avatar_ttg_xiaoai", playerName: "小爱", heroAvatar: "ic_hero_avatar_peiqinhu", level: 15, skill: "ic_hero_skill_smite", blood: 1000, economy: 16269, kills: 15, deaths: 5, assists: 2, equipmentList: equipmentList3),

            GameHeroInfoData(teamName: "广州TTG", playerAvatar: "ic_avatar_ttg_xunuo", playerName: "许诺", heroAvatar: "ic_hero_avatar_jiangziya", level: 15, skill: "ic_hero_skill_flash", blood: 1000, economy: 11999, kills: 2, deaths: 10, assists: 13, equipmentList: equipmentList4),

            GameHeroInfoData(teamName: "广州TTG", playerAvatar: "ic_avatar_ttg_zihuan", playerName: "紫幻", heroAvatar: "ic_hero_avatar_zhuangzhou", level: 15, skill: "ic_hero_skill_heal", blood: 1000, economy: 13024, kills: 3, deaths: 4, assists: 18, equipmentList: equipmentList5),
        ]
    }

    // MARK: 获取红队选手信息、英雄信息

    func getRedTeamList() -> [GameHeroInfoData] {
        let equipmentList1 = ["ic_hero_equipment12", "ic_hero_equipment33", "ic_hero_equipment8", "ic_hero_equipment2", "ic_hero_equipment9", "ic_hero_equipment27"]
        let equipmentList2 = ["ic_hero_equipment6", "ic_hero_equipment12", "ic_hero_equipment33", "ic_hero_equipment2", "ic_hero_equipment8", "ic_hero_equipment21"]
        let equipmentList3 = ["ic_hero_equipment32", "ic_hero_equipment29", "ic_hero_equipment26", "ic_hero_equipment15", "ic_hero_equipment10", "ic_hero_equipment5"]
        let equipmentList4 = ["ic_hero_equipment30", "ic_hero_equipment12", "ic_hero_equipment24", "ic_hero_equipment26", "ic_hero_equipment3", "ic_hero_equipment27"]
        let equipmentList5 = ["ic_hero_equipment34", "ic_hero_equipment8", "ic_hero_equipment13", "ic_hero_equipment25", "ic_hero_equipment1", "ic_hero_equipment17"]

        return [
            GameHeroInfoData(teamName: "佛山DRG", playerAvatar: "ic_avatar_drg_baishou", playerName: "百兽", heroAvatar: "ic_hero_avatar_kuangtie", level: 15, skill: "ic_hero_skill_flash", blood: 1000, economy: 14777, kills: 10, deaths: 8, assists: 1, equipmentList: equipmentList1),

            GameHeroInfoData(teamName: "佛山DRG", playerAvatar: "ic_avatar_drg_pengpeng", playerName: "鹏鹏", heroAvatar: "ic_hero_avatar_dianwei", level: 15, skill: "ic_hero_skill_flash", blood: 1000, economy: 12320, kills: 9, deaths: 11, assists: 7, equipmentList: equipmentList2),

            GameHeroInfoData(teamName: "佛山DRG", playerAvatar: "ic_avatar_drg_xiaodu", playerName: "小度", heroAvatar: "ic_hero_avatar_xishi", level: 15, skill: "ic_hero_skill_smite", blood: 1000, economy: 13449, kills: 5, deaths: 5, assists: 10, equipmentList: equipmentList3),

            GameHeroInfoData(teamName: "佛山DRG", playerAvatar: "ic_avatar_drg_yousan", playerName: "有伞", heroAvatar: "ic_hero_avatar_caiwenji", level: 15, skill: "ic_hero_skill_flash", blood: 1000, economy: 11590, kills: 0, deaths: 4, assists: 17, equipmentList: equipmentList4),

            GameHeroInfoData(teamName: "佛山DRG", playerAvatar: "ic_avatar_drg_yuan", playerName: "源", heroAvatar: "ic_hero_avatar_chengjisihan", level: 15, skill: "ic_hero_skill_flash", blood: 1000, economy: 13208, kills: 7, deaths: 9, assists: 5, equipmentList: equipmentList5),
        ]
    }
}
