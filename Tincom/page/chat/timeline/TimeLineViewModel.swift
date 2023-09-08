//
//  TimeLineViewModel.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/9/1.
//

import Foundation

class TimeLineViewModel {
    /// 获取朋友圈数据
    func fetchTimeLineData() -> [TimeLineItemData] {
        return [
            getTimeLineData4(),
            getTimeLineData2(),
            getTimeLineData3(),
            getTimeLineData1(),
        ]
    }

    ///   // 第一则朋友圈
    private func getTimeLineData1() -> TimeLineItemData {
        let commentData1 = TimeLineItemData.CommentItemData(
            avatar: .icAvatarMayun,
            name: "马云",
            personalId: "",
            comment: "我对钱没兴趣"
        )

        let commentData2 = TimeLineItemData.CommentItemData(
            avatar: .icAvatarMahuateng,
            name: "马化腾",
            personalId: "",
            comment: "我们都是普通家庭，没什么特殊的，就是房子稍微大了点"
        )

        let commentData3 = TimeLineItemData.CommentItemData(
            avatar: .icAvatarMayun,
            name: "马云",
            personalId: "",
            comment: "以前说对钱没兴趣，网友经常笑话我。我对钱真没兴趣，但对花钱还是有兴趣的"
        )

        let commentData4 = TimeLineItemData.CommentItemData(
            avatar: .icAvatarJielun,
            name: "周杰伦",
            personalId: "",
            comment: "哎哟~不错哦"
        )

        let commentGroup1 = TimeLineItemData.CommentData(
            commentItem: [
                commentData1,
                commentData2,
                commentData3,
            ]
        )

        let commentGroup2 = TimeLineItemData.CommentData(
            commentItem: [commentData4]
        )

        let mediaData = TimeLineItemData.MediaData(
            mediaType: 0,
            text: "说出你们的名言",
            image: nil,
            video: nil,
            artical: nil
        )

        let commentCount = commentGroup1.commentItem.count + commentGroup2.commentItem.count

        return TimeLineItemData(
            avatar: .icMyAvatar,
            personalId: "1",
            nickName: "早知",
            postTime: "2小时前",
            deviceName: "Apple Vision Pro",
            location: "珠江新城",
            likeCount: Int.random(
                in: 0 ... 99
            ),
            commentCount: commentCount,
            isLiked: false,
            mediaData: mediaData,
            commentData: [
                commentGroup1,
                commentGroup2,
            ]
        )
    }

    private func getTimeLineData2() -> TimeLineItemData {
        let mediaData = TimeLineItemData.MediaData(
            mediaType: 1,
            text: "我真的只是平平无奇",
            image: [.icCoverGutianle],
            video: nil,
            artical: nil
        )

        let commentData1 = TimeLineItemData.CommentItemData(
            avatar: .icAvatarLiming,
            name: "黎明",
            personalId: "",
            comment: "其实我当年也一般，到现在也是一般"
        )

        let commentData2 = TimeLineItemData.CommentItemData(
            avatar: .icAvatarWuyanzu,
            name: "吴彦祖",
            personalId: "",
            comment: "我从来不觉得自己帅"
        )

        let commentGroup = TimeLineItemData.CommentData(
            commentItem: [
                commentData1,
                commentData2,
            ]
        )

        return TimeLineItemData(
            avatar: .icAvatarGutianle,
            personalId: "2",
            nickName: "古天乐",
            postTime: "3小时前",
            deviceName: "iphone12 Pro Max",
            location: "中国香港",
            likeCount: Int.random(
                in: 0 ... 99
            ),
            commentCount: commentGroup.commentItem.count,
            isLiked: true,
            mediaData: mediaData,
            commentData: [commentGroup]
        )
    }

    private func getTimeLineData3() -> TimeLineItemData {
        let artical = TimeLineItemData.ArticalData(
            cover: .icCoverMiaoya,
            title: "对AI创业者的灵魂拷问： 为什么是“妙鸭相机”做成了“妙鸭相机",
            content: "AI必将深刻改变人类的生活，妙鸭相机就是一个绝佳的例子。"
        )

        let mediaData = TimeLineItemData.MediaData(
            mediaType: 3,
            text: "转发妙鸭文章",
            image: nil,
            video: nil,
            artical: artical
        )

        return TimeLineItemData(
            avatar: .icMyAvatar,
            personalId: "4",
            nickName: "早知",
            postTime: "5小时前",
            deviceName: "iphone12 Pro Max",
            location: "广州图书馆",
            likeCount: 0,
            commentCount: Int.random(
                in: 0 ... 99
            ),
            isLiked: false,
            mediaData: mediaData,
            commentData: nil
        )
    }

    private func getTimeLineData4() -> TimeLineItemData {
        let mediaData = TimeLineItemData.MediaData(
            mediaType: 1,
            text: "3D Model Test",
            image: [.icCoverAppleWatch],
            video: nil,
            artical: nil
        )

        return TimeLineItemData(
            avatar: .icMyAvatar,
            personalId: "3",
            nickName: "早知",
            postTime: "昨天",
            deviceName: "iphone12 Pro Max",
            location: "广州天环广场·Apple Store",
            likeCount: 0,
            commentCount: Int.random(
                in: 0 ... 99
            ),
            isLiked: false,
            mediaData: mediaData,
            commentData: nil
        )
    }
}
