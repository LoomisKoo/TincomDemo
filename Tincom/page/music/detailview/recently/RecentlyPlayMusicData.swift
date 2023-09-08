//
//  RecentlyPlaySongData.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/28.
//

import Foundation

// MARK: 最近播放歌曲data

struct RecentlyPlayMusicData: Hashable {
    let songName: String /// 歌名
    let singger: String /// 歌手
    let playTime: String /// 最近播放的时间
}
