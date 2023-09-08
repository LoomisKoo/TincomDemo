//
//  MusicLyricView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/28.
//

import SwiftUI

// MARK: 歌词view

struct MusicLyricView: View {
    @State var timer: Timer?

    @State var progress = 0.0

    var body: some View {
        ZStack(alignment: .leading) {
            Text("你是千堆雪 我是长街 怕日出一到 彼此瓦解")
                .font(.title2)
                .frame(maxHeight: .infinity)
                .lineLimit(1)

            Text("你是千堆雪 我是长街 怕日出一到 彼此瓦解")
                .font(.title2)
                .lineLimit(1)
                .foregroundColor(.blue)
                .mask(
                    GeometryReader { geometry in
                        // TODO: 这里获取的宽度是GeometryReader撑大后的，不是Text的宽度
                        let progressWidth = geometry.size.width / 100 * progress

                        Rectangle() // 创建一个矩形遮罩
                            .frame(width: progressWidth) // 根据变色进度设置遮罩宽度
                    }
                )
        }

        .onAppear {
            startAnimation()
        }
        .onDisappear {
            stopAnimation()
        }
    }

    /// 开始动画
    private func startAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            DispatchQueue.main.async {
                let preProgress = progress + 0.5
                if preProgress > 100 {
                    progress = 0
                } else {
                    withAnimation {
                        progress = preProgress
                    }
                }
            }
        }
    }

    /// 停止动画
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    MusicLyricView()
}
