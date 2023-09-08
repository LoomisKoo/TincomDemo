//
//  TimeLineItemData.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/9/1.
//

import Foundation
import SwiftUI

// MARK: 朋友圈itme的数据类

@Observable
class TimeLineItemData: Hashable {
    static func == (lhs: TimeLineItemData, rhs: TimeLineItemData) -> Bool {
        lhs.personalId == rhs.personalId
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(personalId)
    }

    let avatar: ImageResource /// 头像
    let personalId: String /// 用户id
    let nickName: String /// 用户昵称
    let postTime: String /// 发文时间
    let deviceName: String? /// 发文的设备名称
    let location: String? /// 发文的定位

    var likeCount: Int /// 点赞数量
    let commentCount: Int /// 评论数量
    var isLiked: Bool /// 是否已点赞
    let mediaData: MediaData /// 是否已点赞

    let commentData: [CommentData]? /// 评论数据

    init(
        avatar: ImageResource,
        personalId: String,
        nickName: String,
        postTime: String,
        deviceName: String?,
        location: String?,
        likeCount: Int,
        commentCount: Int,
        isLiked: Bool,
        mediaData: MediaData,
        commentData: [CommentData]?
    ) {
        self.avatar = avatar
        self.personalId = personalId
        self.nickName = nickName
        self.postTime = postTime
        self.deviceName = deviceName
        self.location = location
        self.likeCount = likeCount
        self.commentCount = commentCount
        self.isLiked = isLiked
        self.mediaData = mediaData
        self.commentData = commentData
    }
}

extension TimeLineItemData {
    // MARK: 评论数据

    struct CommentData: Hashable {
        let commentItem: [CommentItemData]

        init(
            commentItem: [CommentItemData]
        ) {
            self.commentItem = commentItem
        }
    }

    // MARK: 评论DATA
    struct CommentItemData: Hashable {
        let avatar: ImageResource /// 头像
        let name: String /// 用户名
        let personalId: String /// 用户id
        let comment: String /// 评论内容

        init(
            avatar: ImageResource,
            name: String,
            personalId: String,
            comment: String
        ) {
            self.avatar = avatar
            self.name = name
            self.personalId = personalId
            self.comment = comment
        }
    }

    // MARK: 媒体Data

    struct MediaData {
        let mediaType: Int /// 媒体类型：0-仅文本，1-图片，2-视频，3-公众号
        let text: String? /// 文本内容
        let image: [ImageResource]? /// 图片
        let video: VideoData? /// 视频
        let artical: ArticalData? /// 公众号文章

        init(
            mediaType: Int,
            text: String?,
            image: [ImageResource]?,
            video: VideoData?,
            artical: ArticalData?
        ) {
            self.mediaType = mediaType
            self.text = text
            self.image = image
            self.video = video
            self.artical = artical
        }
    }

    // MARK: 视频DATA

    struct VideoData {
        let cover: ImageResource // 封面
        let url: String // 播放地址

        init(cover: ImageResource, url: String) {
            self.cover = cover
            self.url = url
        }
    }

    // MARK: 文章DATA

    struct ArticalData {
        let cover: ImageResource /// 文章封面
        let title: String /// 文章标题
        let content: String /// 文章内容

        init(
            cover: ImageResource,
            title: String,
            content: String
        ) {
            self.cover = cover
            self.title = title
            self.content = content
        }
    }
}
