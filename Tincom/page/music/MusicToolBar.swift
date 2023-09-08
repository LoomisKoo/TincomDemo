//
//  MusicToolBar.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/20.
//

import Foundation
import SwiftUI

struct MusicToolBar: View {
    private let cornerRadius: CGFloat = 10

    @State private var isPlaying = false
    @State private var isFavorite = false
    @State private var playProgress = 50.0

    @State private var progressValue: Double = 50

    @State private var hoverLocation: CGPoint = .zero
    @State private var isHovering = false

    var body: some View {
        HStack {
            /// 上一首
            FunctionButton("backward.end", buttonSize: 30) {
                print("koo----- preSongs")
            }

            /// 暂停/播放
            FunctionButton(isPlaying ? "play" : "pause", buttonSize: 35) {
                withAnimation(Animation.bouncy) {
                    isPlaying.toggle()
                }
            }

            /// 下一首
            FunctionButton("forward.end", buttonSize: 30) {
                print("koo----- nextSongs")
            }

            /// 歌曲信息
            songBaseInfo()
                .frame(width: 500)
                .background(.black.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .padding(.horizontal, 30)

            /// 随机播放
            FunctionButton("shuffle", buttonSize: 30)

            /// 评论
            FunctionButton("text.bubble", buttonSize: 30)

            /// 音量
            FunctionButton("speaker.wave.3", buttonSize: 30)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 2)
        .frame(maxWidth: .infinity)
    }

    private func songBaseInfo() -> some View {
        return ZStack(alignment: .bottom) {
            HStack(alignment: .center) {
                /// 头像/封面
                Image("ic_avatar_wagnfei")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(cornerRadius)
                    .hoverRadiusEffect(cornerRadius)

                VStack(alignment: .leading) {
                    Text("王菲")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical, 1)

                    Text("《邮差》")
                        .font(.system(size: 17, weight: .bold))
                        .opacity(0.6)
                }

                Spacer()

                /// 收藏/取消收藏
                FunctionButton(isFavorite ? "heart.fill" : "heart", buttonSize: 25) {
                    withAnimation {
                        isFavorite.toggle()
                    }
                }.foregroundColor(isFavorite ? Color.red : Color.white)

                /// 更多
                FunctionButton("ellipsis", buttonSize: 25)
                    .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)

            /// 进度条
            ProgressView(value: playProgress, total: 100)
                .progressViewStyle(.linear)
                .frame(maxWidth: .infinity)
        }
    }
}

// MARK: 各个功能按钮

private struct FunctionButton: View {
    private var buttonSize: CGFloat = 35

    private var onClick: (() -> Void)?

    var imaName: String = ""

    init(_ imaName: String, buttonSize: CGFloat = 40, onClick: (() -> Void)? = nil) {
        self.onClick = onClick
        self.buttonSize = buttonSize
        self.imaName = imaName
    }

    var body: some View {
        Button(action: {
            onClick?()
        }, label: {
            Image(systemName: imaName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: buttonSize, height: buttonSize)
                .padding(15)
                .transition(.scale)
        })
        .hoverCircleEffect()
    }
}

#Preview {
    MusicToolBar()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
