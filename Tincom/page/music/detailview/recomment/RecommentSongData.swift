//
//  SongListData.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/22.
//

import Foundation
/// 歌曲列表data
struct RecommentSongData: Hashable {
    let songName: String // 歌曲名称
    let isHD: Bool // 是否HD
    let isSQ: Bool // 是否SQ
    let hasMv: Bool // 是否有MV
    let durating: Int // 歌曲时长（秒）

    init(songName: String, isHD: Bool, isSQ: Bool, hasMv: Bool, durating: Int) {
        self.songName = songName
        self.isHD = isHD
        self.isSQ = isSQ
        self.hasMv = hasMv
        self.durating = durating
    }
}
