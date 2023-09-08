//
//  RecentlyPlayMusiListView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/28.
//

import SwiftUI

// MARK: 最近播放列表

struct RecentlyPlayMusiListView: View {
    @State private var listData = [RecentlyPlayMusicData]()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                header()
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)

                Divider()

                songListView()
            }
        }
        .padding()
        .onAppear {
            listData = RecentlyPlayMusicVM().getSongList()
        }
    }

    // MARK: 头部

    private func header() -> some View {
        VStack(alignment: .leading) {
            // MARK: 歌曲数

            Text("共33首")
                .font(.system(size: 22)).bold()
                .foregroundColor(.white.opacity(0.5))

            HStack {
                // MARK: 播放全部

                HStack(spacing: 5) {
                    Image(systemName: "play.circle.fill")
                    Text("播放全部")
                        .font(.system(size: 25))
                }
                .padding(8)
                .padding(.horizontal, 10)
                .background(Color.blue)
                .clipShape(Capsule())
                .hoverCapsuleEffect()

                Spacer()

                // MARK: 清空列表按钮

                Text("清空列表")
                    .font(.title)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .foregroundColor(.white.opacity(0.7))
                    .hoverCapsuleEffect()
            }
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: 歌曲列表

    private func songListView() -> some View {
        LazyVStack(spacing: 0) {
            // MARK: 列表title

            HStack(spacing: 0) {
                
                /// 占位
                Spacer().frame(width: 100)
                
                Text("歌曲名称")
                    .font(.system(size: 25))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

                Text("歌手")
                    .font(.system(size: 25))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

                Text("播放时间")
                    .font(.system(size: 25))
                    .frame(width: 200, alignment: .leading)
            }
            .padding(.vertical, 20)

            // MARK: 歌曲列表items

            ForEach(0 ..< listData.count, id: \.self) { index in
                let item = listData[index]
                SongItemView(index: index, data: item)
            }
        }
        .padding(.bottom, 30) /// 避免底部被toolBar挡住
    }
}

// MARK: 歌曲item

private struct SongItemView: View {
    private let data: RecentlyPlayMusicData
    private let index: Int

    init(index: Int, data: RecentlyPlayMusicData) {
        self.index = index
        self.data = data
    }

    var body: some View {
        HStack(spacing: 0) {
            /// 序号
            Text("\(index)")
                .font(.system(size: 25))
                .foregroundColor(.gray)
                .frame(width: 100)
            
            /// 歌曲名
            Text(data.songName)
                .font(.system(size: 25))
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            /// 歌手
            Text(data.singger)
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .opacity(0.85)
            
            /// 上次播放时间
            Text(data.playTime)
                .font(.system(size: 20))
                .frame(width: 200, alignment: .leading)
                .opacity(0.7)
        }
        .padding(.vertical, 20)
        .hoverRadiusEffect(10, hPadding: 0, vPadding: 0)
    }
}

#Preview {
    RecentlyPlayMusiListView()
}
