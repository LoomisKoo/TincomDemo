//
//  MusicVideoData.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/26.
//

import Foundation

// MARK: 视频信息data

struct MusicVideoData: Hashable {
    let coverUrl: String // 视频封面
    let videoLength: Int // 视频封面
    let videoName: String // 视频名称
    let author: String // 作者
    let playCount: Int // 播放量
    
    init(coverUrl: String, videoLength: Int, videoName: String, author: String, playCount: Int) {
        self.coverUrl = coverUrl
        self.videoLength = videoLength
        self.videoName = videoName
        self.author = author
        self.playCount = playCount
    }
}
