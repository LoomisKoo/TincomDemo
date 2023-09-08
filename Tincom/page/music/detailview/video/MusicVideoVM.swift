//
//  MusicVideoVM.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/26.
//

import Foundation

// MARK: 视频vm

class MusicVideoVM {
    /// 获取视频列表数据
func getVideoList() -> [MusicVideoData] {
        return [
            MusicVideoData(coverUrl: "https://tx-free-imgs.acfun.cn/o_1e2fen2gk10k2138117ni29t1m8k0.jpeg?imageslim", videoLength: 222, videoName: "很久以后", author: "邓紫棋", playCount: 202000),
            MusicVideoData(coverUrl: "https://i0.hdslb.com/bfs/archive/29f0738d08f11a58d9a2524a862a0100f212d61b.jpg", videoLength: 222, videoName: "谢幕", author: "林俊杰", playCount: 222222),
            MusicVideoData(coverUrl: "https://y.gtimg.cn/music/photo_new/T023R750x750M000001NumYl27Sehj.jpg?max_age=2592000", videoLength: 222, videoName: "爱在西元前", author: "周杰伦", playCount: 123312),
            MusicVideoData(coverUrl: "https://c-ssl.dtstatic.com/uploads/item/201207/24/20120724132220_azjeL.thumb.1000_0.jpeg", videoLength: 232, videoName: "七里香", author: "周杰伦", playCount: 98333),
            MusicVideoData(coverUrl: "https://u6.iqiyipic.com/image/20190816/05/2f/pv_4998535700_d_601.jpg", videoLength: 211, videoName: "跳舞的梵谷", author: "孙燕姿", playCount: 220003),
            MusicVideoData(coverUrl: "https://pic3.iqiyipic.com/image/20230108/05/d4/v_170899314_m_601_480_270.jpg", videoLength: 209, videoName: "早知", author: "谢霆锋", playCount: 887774),
            MusicVideoData(coverUrl: "https://i1.hdslb.com/bfs/archive/d81cfe47361a053f9923aae0867a567441a7fa13.png", videoLength: 255, videoName: "估计错误", author: "谢霆锋", playCount: 333883),
            MusicVideoData(coverUrl: "https://i0.hdslb.com/bfs/archive/a42c78192f6c1c762dc1fcafd2a44ba26a33d9df.jpg", videoLength: 205, videoName: "香水", author: "谢霆锋", playCount: 3333302),
            MusicVideoData(coverUrl: "https://puui.qpic.cn/vpic_cover/g3345gn5xm2/g3345gn5xm2_old_ori.jpg/s640x360?max_age=7776000", videoLength: 199, videoName: "暗里着迷", author: "刘德华", playCount: 77655872),
            MusicVideoData(coverUrl: "https://i2.hdslb.com/bfs/archive/d2f61ef7b4edb53d857b576adc0bf1a75f19cef8.jpg", videoLength: 207, videoName: "慢慢喜欢你", author: "莫文蔚", playCount: 45255756),
            MusicVideoData(coverUrl: "https://pic3.iqiyipic.com/image/20221018/1f/b2/v_169653952_m_601_480_270.jpg", videoLength: 210, videoName: "如愿", author: "王菲", playCount: 5697805),
            MusicVideoData(coverUrl: "https://y.gtimg.cn/music/photo_new/T023R750x750M000001eRytG3vlGIB.jpg?max_age=2592000", videoLength: 214, videoName: "约定", author: "王菲", playCount: 3986389),
            MusicVideoData(coverUrl: "https://puui.qpic.cn/vpic_cover/i0731bmoieb/i0731bmoieb_old_ori.jpg/s640x360?max_age=7776000", videoLength: 222, videoName: "做自己的太阳", author: "陈慧琳", playCount: 38467038),
            MusicVideoData(coverUrl: "https://y.gtimg.cn/music/photo_new/T015R640x360M101002u4E7S1wDxts.jpg", videoLength: 208, videoName: "百年树木", author: "张敬轩", playCount: 29350489),
            MusicVideoData(coverUrl: "https://inews.gtimg.com/newsapp_bt/0/14523702873/1000", videoLength: 212, videoName: "幼稚未完", author: "林峯", playCount: 2980680243),
            MusicVideoData(coverUrl: "https://y.gtimg.cn/music/photo_new/T053R750x750M000002HMLqn2Y6IYz.jpg?max_age=2592000", videoLength: 231, videoName: "最爱", author: "周慧敏", playCount: 89347592),
        ]
        .shuffled()
    }
}
