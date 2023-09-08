//
//  RecentlyPlayMusicVM.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/28.
//

import Foundation

// MARK: 最近播放音乐的vm

class RecentlyPlayMusicVM {
    func getSongList() -> [RecentlyPlayMusicData] {
        return [
            RecentlyPlayMusicData(songName: "必杀技", singger: "古巨基", playTime: "10分钟前"),
            RecentlyPlayMusicData(songName: "无声仿有声", singger: "谢霆锋", playTime: "21分钟前"),
            RecentlyPlayMusicData(songName: "淘汰", singger: "陈奕迅", playTime: "昨天"),
            RecentlyPlayMusicData(songName: "兄弟", singger: "任贤齐", playTime: "昨天"),
            RecentlyPlayMusicData(songName: "少女的祈祷", singger: "杨千嬅", playTime: "昨天"),
            RecentlyPlayMusicData(songName: "后来", singger: "张敬轩", playTime: "2023年07月22日"),
            RecentlyPlayMusicData(songName: "善良", singger: "谢霆锋", playTime: "2023年07月22日"),
            RecentlyPlayMusicData(songName: "早知", singger: "谢霆锋", playTime: "2023年07月22日"),
            RecentlyPlayMusicData(songName: "玻璃之情", singger: "张国荣", playTime: "2023年07月22日"),
            
            RecentlyPlayMusicData(songName: "必杀技", singger: "古巨基", playTime: "10分钟前"),
            RecentlyPlayMusicData(songName: "无声仿有声", singger: "谢霆锋", playTime: "21分钟前"),
            RecentlyPlayMusicData(songName: "淘汰", singger: "陈奕迅", playTime: "昨天"),
            RecentlyPlayMusicData(songName: "兄弟", singger: "任贤齐", playTime: "昨天"),
            RecentlyPlayMusicData(songName: "少女的祈祷", singger: "杨千嬅", playTime: "昨天"),
            RecentlyPlayMusicData(songName: "后来", singger: "张敬轩", playTime: "2023年07月22日"),
            RecentlyPlayMusicData(songName: "善良", singger: "谢霆锋", playTime: "2023年07月22日"),
            RecentlyPlayMusicData(songName: "早知", singger: "谢霆锋", playTime: "2023年07月22日"),
            RecentlyPlayMusicData(songName: "玻璃之情", singger: "张国荣", playTime: "2023年07月22日"),
        ]
    }
}
