//
//  RecommentMusicVM.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/22.
//

import Foundation
import Observation

@Observable
class RecommentMusicVM {
    func getSongList(type: EnumSongType) -> [RecommentSongData] {
        return switch type {
        case .CHINESE: getChineseSongList()
        case .CANTONESE: getCantoneseList()
        case .EUR_US: getEurUSSongList()
        case .JAPAN_KOREA: getJapanKoreaSongList()
        }
    }

    // MARK: 国语歌曲列表

    private func getChineseSongList() -> [RecommentSongData] {
        return [
            RecommentSongData(songName: "又十年", isHD: true, isSQ: false, hasMv: false, durating: 238),
            RecommentSongData(songName: "晴天", isHD: false, isSQ: true, hasMv: true, durating: 238),
            RecommentSongData(songName: "步步", isHD: true, isSQ: false, hasMv: true, durating: 240),
            RecommentSongData(songName: "傻子", isHD: false, isSQ: true, hasMv: false, durating: 238),
            RecommentSongData(songName: "第一次", isHD: false, isSQ: true, hasMv: true, durating: 234),
            RecommentSongData(songName: "盛夏的果实", isHD: true, isSQ: false, hasMv: true, durating: 238),
            RecommentSongData(songName: "挪威的森林", isHD: true, isSQ: false, hasMv: true, durating: 248),
            RecommentSongData(songName: "可惜没如果", isHD: false, isSQ: true, hasMv: false, durating: 230),
            RecommentSongData(songName: "浪费", isHD: true, isSQ: false, hasMv: true, durating: 252),
            RecommentSongData(songName: "以外", isHD: false, isSQ: true, hasMv: true, durating: 222),
            RecommentSongData(songName: "感同身受", isHD: false, isSQ: true, hasMv: true, durating: 231),
            RecommentSongData(songName: "说谎", isHD: true, isSQ: false, hasMv: false, durating: 241),
        ]
    }

    // MARK: 粤语歌曲列表

    private func getCantoneseList() -> [RecommentSongData] {
        return [
            RecommentSongData(songName: "海阔天空", isHD: true, isSQ: false, hasMv: false, durating: 238),
            RecommentSongData(songName: "必杀技", isHD: false, isSQ: true, hasMv: true, durating: 238),
            RecommentSongData(songName: "你瞒我瞒", isHD: true, isSQ: false, hasMv: true, durating: 240),
            RecommentSongData(songName: "千千阙歌", isHD: false, isSQ: true, hasMv: false, durating: 238),
            RecommentSongData(songName: "富士山下", isHD: false, isSQ: true, hasMv: true, durating: 234),
            RecommentSongData(songName: "不浪漫罪名", isHD: true, isSQ: false, hasMv: true, durating: 238),
            RecommentSongData(songName: "吴哥窟", isHD: true, isSQ: false, hasMv: true, durating: 248),
            RecommentSongData(songName: "光辉岁月", isHD: false, isSQ: true, hasMv: false, durating: 230),
            RecommentSongData(songName: "处处吻", isHD: true, isSQ: false, hasMv: true, durating: 252),
            RecommentSongData(songName: "无赖", isHD: false, isSQ: true, hasMv: true, durating: 222),
            RecommentSongData(songName: "少女的祈祷", isHD: false, isSQ: true, hasMv: true, durating: 231),
            RecommentSongData(songName: "喜欢你", isHD: true, isSQ: false, hasMv: false, durating: 241),
            RecommentSongData(songName: "红日", isHD: true, isSQ: false, hasMv: false, durating: 241),
            RecommentSongData(songName: "够钟", isHD: true, isSQ: false, hasMv: false, durating: 241),
        ]
    }

    // MARK: 欧美歌曲列表

    private func getEurUSSongList() -> [RecommentSongData] {
        return [
            RecommentSongData(songName: "Love Story", isHD: true, isSQ: false, hasMv: false, durating: 238),
            RecommentSongData(songName: "Love Yourself", isHD: false, isSQ: true, hasMv: true, durating: 238),
            RecommentSongData(songName: "That Girl", isHD: true, isSQ: false, hasMv: true, durating: 240),
            RecommentSongData(songName: "Price Tag", isHD: false, isSQ: true, hasMv: false, durating: 238),
            RecommentSongData(songName: "My Boyfriend Is Gay", isHD: false, isSQ: true, hasMv: true, durating: 234),
            RecommentSongData(songName: "Lone Ranger", isHD: true, isSQ: false, hasMv: true, durating: 238),
            RecommentSongData(songName: "Something Just Like This", isHD: true, isSQ: false, hasMv: true, durating: 248),
            RecommentSongData(songName: "SOuld Out", isHD: false, isSQ: true, hasMv: false, durating: 230),
            RecommentSongData(songName: "Just Give Me a Reason", isHD: true, isSQ: false, hasMv: true, durating: 252),
            RecommentSongData(songName: "Wrecking Ball", isHD: false, isSQ: true, hasMv: true, durating: 222),
            RecommentSongData(songName: "Careless Whisper", isHD: false, isSQ: true, hasMv: true, durating: 231),
            RecommentSongData(songName: "Billie Jean", isHD: true, isSQ: false, hasMv: false, durating: 241),
        ]
    }

    // MARK: 日韩歌曲列表

    private func getJapanKoreaSongList() -> [RecommentSongData] {
        return [
            RecommentSongData(songName: "운명", isHD: true, isSQ: false, hasMv: false, durating: 238),
            RecommentSongData(songName: "오나라Ⅱ", isHD: false, isSQ: true, hasMv: true, durating: 238),
            RecommentSongData(songName: "기도", isHD: true, isSQ: false, hasMv: true, durating: 240),
            RecommentSongData(songName: "Nobody", isHD: false, isSQ: true, hasMv: false, durating: 238),
            RecommentSongData(songName: "IF YOU", isHD: false, isSQ: true, hasMv: true, durating: 234),
            RecommentSongData(songName: "DAY BY DAY", isHD: true, isSQ: false, hasMv: true, durating: 238),
            RecommentSongData(songName: "モノクロのキス", isHD: true, isSQ: false, hasMv: true, durating: 248),
            RecommentSongData(songName: "ありがとう", isHD: false, isSQ: true, hasMv: false, durating: 230),
            RecommentSongData(songName: "ふたつの唇", isHD: true, isSQ: false, hasMv: true, durating: 252),
            RecommentSongData(songName: "バラード", isHD: false, isSQ: true, hasMv: true, durating: 222),
            RecommentSongData(songName: "夢みたあとで", isHD: false, isSQ: true, hasMv: true, durating: 231),
            RecommentSongData(songName: "世界が终るまでは", isHD: true, isSQ: false, hasMv: false, durating: 241),
        ]
    }

    // MARK: 获取专辑列表数据

    func getAlbumList() -> [RecommentAlbumData] {
        return [
            RecommentAlbumData(cover: "https://img.zcool.cn/community/01db1a5e4d311ba801216518b7fd33.jpg", albumName: "世界感官", author: "林宥嘉", releaseData: "2009年10月"),
            RecommentAlbumData(cover: "https://img1.baidu.com/it/u=137662096,3508639311&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500", albumName: "新地球", author: "林俊杰", releaseData: "2014年12月"),
            RecommentAlbumData(cover: "https://pic1.zhimg.com/80/v2-6f067bf071e5743265da744d5cc64a1c_1440w.jpg", albumName: "Jay", author: "周杰伦", releaseData: "2000年11月"),
            RecommentAlbumData(cover: "https://bkimg.cdn.bcebos.com/pic/a08b87d6277f9e2f0708f1433a65fe24b899a9015578", albumName: "启示录", author: "邓紫棋", releaseData: "2022年8月"),
        ]
    }
}
