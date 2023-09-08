//
//  RecommentAlbumData.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/22.
//

import Foundation

// MARK: 专辑data

struct RecommentAlbumData: Hashable {
    let cover: String // 专辑封面
    let albumName: String // 专辑名称
    let author: String // 作者
    let releaseData: String // 发行日期

    init(cover: String, albumName: String, author: String, releaseData: String) {
        self.cover = cover
        self.albumName = albumName
        self.author = author
        self.releaseData = releaseData
    }
}
