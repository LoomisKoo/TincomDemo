//
//  FavoriteMusicVM.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/27.
//

import Foundation

// MARK: 喜欢的音乐VM

class FavoriteMusicVM {
    func getSongList() -> [FavoriteMusicListData] {
        return [
            FavoriteMusicListData(songName: "青花瓷", singger: "周杰伦", album: "我很忙", duration: 231, hasDownload: true),
            FavoriteMusicListData(songName: "离开地球表面", singger: "五月天", album: "离开地球表面 jump！", duration: 321, hasDownload: false),
            FavoriteMusicListData(songName: "勇气", singger: "梁静茹", album: "勇气", duration: 231, hasDownload: false),
            FavoriteMusicListData(songName: "有心人", singger: "张国荣", album: "Love With All My Heart", duration: 211, hasDownload: true),
            FavoriteMusicListData(songName: "森林", singger: "Mr.", album: "if I Am...", duration: 198, hasDownload: false),
            FavoriteMusicListData(songName: "神秘嘉宾", singger: "林宥嘉", album: "神秘嘉宾", duration: 199, hasDownload: false),
            FavoriteMusicListData(songName: "可惜没如果", singger: "林俊杰", album: "新地球GENESIS", duration: 234, hasDownload: true),
            FavoriteMusicListData(songName: "少女的祈祷", singger: "杨千嬅", album: "Play It Loud, Kiss Me Soft", duration: 244, hasDownload: true),
        ]
    }
}
