//
//  SongListData.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/27.
//

import Foundation
// 我的喜欢歌曲列表data
struct FavoriteMusicListData: Hashable {
    let songName: String // 歌曲名
    let singger: String // 歌手
    let album: String // 专辑
    let duration: Int // 时长
    let hasDownload: Bool // 是否已经下载

    init(songName: String, singger: String, album: String, duration: Int, hasDownload: Bool) {
        self.songName = songName
        self.singger = singger
        self.album = album
        self.duration = duration
        self.hasDownload = hasDownload
    }
}
