//
//  TimeLineItemView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/8/25.
//

import SwiftUI

// MARK: 朋友圈itemView

struct TimeLineItemView: View {
    // 朋友圈数据
    @Binding var data: TimeLineItemData

    init(data: Binding<TimeLineItemData>) {
        _data = data
    }

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            /// 头像
            avatar

            VStack(alignment: .leading, spacing: 15) {
                /// 基本信息
                baseInfoView

                if let text = data.mediaData.text, !text.isEmpty {
                    Text(text)
                        .font(.system(size: 28))
                        .bold()
                }

                /// 图片、视频等附加信息
                ExtraInfoViewDetails(data)

                /// 按钮模块
                ButtonView($data)

                /// 评论模块
                commentView

                Divider().frame(height: 30)
            }
        }
    }
}

// MARK: subView

extension TimeLineItemView {
    // MARK: 头像

    private var avatar: some View {
        Image(data.avatar)
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 75)
            .cornerRadius(10)
            .hoverRadiusEffect(10)
    }

    // MARK: 每侧朋友圈的顶部基本信息：昵称、时间、平台

    private var baseInfoView: some View {
        HStack(alignment: .bottom) {
            let name = data.nickName
            /// 昵称
            Text(name)
                .font(.system(size: 25))
                .bold()

            HStack {
                /// 时间
                Text(data.postTime)

                Text("·")

                if let device = data.deviceName {
                    // 发文设备
                    Text(device)
                }
            }
            .font(.system(size: 20))
            .bold()
            .foregroundColor(.white.opacity(0.6))
        }
    }

    // MARK: 评论、点赞、定位按钮

    private struct ButtonView: View {
        @Binding var data: TimeLineItemData

        init(_ data: Binding<TimeLineItemData>) {
            _data = data
        }

        var body: some View {
            HStack(spacing: 20) {
                /// 评论按钮
                button(text: "\(data.commentCount)", icon: "text.bubble.fill", iconSize: 30)

                /// 点赞按钮
                button(text: "\(data.likeCount)",
                       icon: data.isLiked ? "heart.fill" : "heart",
                       iconSize: 30,
                       iconColor: data.isLiked ? Color.red.opacity(0.8) : Color.white
                )
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        data.isLiked.toggle()
                        data.likeCount = data.isLiked ? data.likeCount + 1 : data.likeCount - 1
                    }
                }

                if let location = data.location {
                    /// 定位按钮
                    button(text: location, icon: "mappin.and.ellipse", iconSize: 25)
                }
            }
        }

        private func button(
            text: String,
            icon: String,
            iconSize: CGFloat,
            iconColor: Color = Color.white
        ) -> some View {
            return Label(
                title: {
                    Text(
                        "\(text)"
                    )
                    .font(
                        .system(
                            size: 20
                        )
                    )
                },
                icon: {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize)
                        .foregroundColor(iconColor)
                }
            )
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .hoverRadiusEffect(10)
            .foregroundColor(.white.opacity(0.8))
        }
    }

    // MARK: 评论view

    private var commentView: some View {
        Group {
            if let commentData = data.commentData {
                /// 评论分组
                ForEach(commentData, id: \.self) { groupData in

                    VStack(alignment: .leading) {
                        /// 同组评论
                        ForEach(groupData.commentItem, id: \.self) { itemData in
                            CommentItemView(avatar: itemData.avatar, name: itemData.name, text: itemData.comment)
                        }
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .hoverRadiusEffect(10)
                }
            } else {
                EmptyView()
            }
        }
    }
}

// MARK: 评论的itemView

private struct CommentItemView: View {
    private let avatar: ImageResource
    private let name: String
    private let text: String

    init(avatar: ImageResource, name: String, text: String) {
        self.avatar = avatar
        self.name = name
        self.text = text
    }

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            /// 评论用户的头像
            Image(avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .cornerRadius(5)
                .hoverRadiusEffect(5)

            VStack(alignment: .leading, spacing: 5) {
                /// 评论用户的昵称
                Text(name)
                    .font(.system(size: 20))
                    .foregroundColor(.white.opacity(0.7))

                /// 评论内容
                Text(text)
                    .font(.system(size: 25))
            }
        }
    }
}

// MARK: 额外信息view（图片、视频等）

private struct ExtraInfoViewDetails: View {
    private let data: TimeLineItemData

    private let mediaType: TimeLineType

    @Environment(\.openWindow) private var open3DWindow
    @Environment(\.dismissWindow) private var dismiss3DWindow

    init(_ data: TimeLineItemData) {
        self.data = data
        mediaType = TimeLineType(rawValue: data.mediaData.mediaType)!
    }

    var body: some View {
        switch mediaType {
        case .text: EmptyView()
        case .picture:
            pictureView
        case .video:
            videoView
        case .article:
            articalView
        }
    }

    // MARK: 图片类型的view

    private var pictureView: some View {
        LazyVGridView(columnsCount: getColumnsCount(), hSpacing: 5, vSpacing: 5) {
            ForEach(data.mediaData.image!, id: \.self) { pic in
                Image(pic)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                    .hoverRadiusEffect(10)
                    .onTapGesture {
                        open3DWindow(id: "AppleWatchWindow", value: 1)
                    }
            }
        }
        .frame(width: getPictureGridWidth())
    }

    /// 图片列数
    private func getColumnsCount() -> Int {
        let picCount = data.mediaData.image?.count ?? 0
        if picCount <= 2 {
            return picCount
        } else if picCount <= 4 {
            return 2
        } else {
            return 3
        }
    }

    /// 每张图片宽度
    private func getPictureGridWidth() -> CGFloat {
        let picCount = data.mediaData.image?.count ?? 0

        if picCount <= 1 {
            return 350
        } else if picCount == 2 {
            return 500
        } else {
            return 650
        }
    }

    // MARK: 视频类型的view

    private var videoView: some View {
        ZStack {
            Image(data.mediaData.video?.cover ?? .icAvatarXueyou)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 500)
                .overlay {
                    Color.black.opacity(0.1)
                }
                .cornerRadius(10)
                .hoverRadiusEffect(10)

            Image(systemName: "play.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
        }
    }

    // MARK: 公众号文章类型的view

    private var articalView: some View {
        VStack(alignment: .leading) {
            /// 文章封面
            Image(.icCoverMiaoya)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .cornerRadius(0)

            let title = data.mediaData.artical?.title ?? ""
            let content = data.mediaData.artical?.content ?? ""
            /// 文章title
            Text(title)
                .font(.title)
                .lineLimit(2)
                .foregroundColor(.white.opacity(0.8))
                .padding(15)

            /// 文章subtitle
            Text(content)
                .font(.title2)
                .lineLimit(2)
                .foregroundColor(.white.opacity(0.5))
                .padding(.bottom, 15)
                .padding(.horizontal, 15)
        }
        .frame(width: 500)
        .background(Color.black.opacity(0.2))
        .cornerRadius(10)
        .hoverRadiusEffect(10)
    }
}

// MARK: 朋友圈额外信息类型

private enum TimeLineType: Int {
    case text = 0
    case picture = 1
    case video = 2
    case article = 3

    static var random: TimeLineType {
        let allValues: [TimeLineType] = [.picture, .video, .article]
        return allValues.randomElement()!
    }
}

#Preview {
    @State var data = TimeLineViewModel().fetchTimeLineData().first!
    return TimeLineItemView(data: $data)
        .padding()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
