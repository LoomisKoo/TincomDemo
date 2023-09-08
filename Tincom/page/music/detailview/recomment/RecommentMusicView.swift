//
//  RecommentMusicView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/21.
//

import Foundation
import SwiftUI

struct RecommentMusicView: View {
    var body: some View {
        ScrollView {
            HStack(alignment: .top, spacing: 30) {
                VStack(spacing: 8) {
                    /// banner
                    RecommentMusicBanner()
                        .padding(.leading, 30)

                    Spacer()

                    /// 歌曲列表
                    SongListView()
                        .padding(.leading, 20)
                }

                /// 专辑列表
                RecommentAlbumView()
                    .padding(.trailing, 20)
            }
        }
    }
}

// MARK: 歌曲列表

private struct SongListView: View {
    @State private var curSongType = EnumSongType.CHINESE

    private let vm = RecommentMusicVM()

    @State private var listData = [RecommentSongData]()

    var body: some View {
        VStack {
            headerView()
                .padding(.leading, 10)
                .frame(maxWidth: .infinity)

            Divider()

            listItems(type: curSongType)
        }
        .padding(.bottom, 30) // 底部预留空间，避免最后一个被toolBar挡住
        .onAppear {
            listData = vm.getSongList(type: curSongType)
        }
        .onChange(of: curSongType) { _, newValue in
            listData = vm.getSongList(type: newValue)
        }
    }

    // MARK: 歌曲列表头部

    private func headerView() -> some View {
        return HStack {
            Text("新歌首发")
                .font(.system(size: 35))

            Spacer()

            HeadTabView(EnumSongType.CHINESE, $curSongType)
            HeadTabView(EnumSongType.CANTONESE, $curSongType)
            HeadTabView(EnumSongType.EUR_US, $curSongType)
            HeadTabView(EnumSongType.JAPAN_KOREA, $curSongType)
        }
    }

    // MARK: 歌曲列表头部tab

    private struct HeadTabView: View {
        // tab类型
        private var songListType: EnumSongType
        // 当前选中的tab类型
        @Binding var curSongListType: EnumSongType

        init(_ songListType: EnumSongType, _ curSongListType: Binding<EnumSongType>) {
            self.songListType = songListType
            _curSongListType = curSongListType
        }

        var body: some View {
            Button(action: {
                curSongListType = songListType
            }, label: {
                Text(songListType.rawValue)
                    .font(.system(size: 20))
                    .padding(5)
            })
            .hoverRadiusEffect(5)
            .background(songListType == curSongListType ? Color.blue : Color.clear)
            .cornerRadius(5)
        }
    }

    // MARK: 歌曲列表

    private func listItems(
        type: EnumSongType
    ) -> some View {
        return
            VStack(spacing: 0) {
                ForEach(self.listData, id: \.self) { data in
                    HStack {
                        Text(data.songName)
                            .font(.system(size: 25))
                            .bold()
                            .foregroundColor(.white)
                        if data.isHD {
                            TagView("HD", Color.green)
                        }
                        if data.isSQ {
                            TagView("SQ", Color.purple)
                        }
                        if data.hasMv {
                            TagView("MV", Color.blue)
                        }

                        Spacer()

                        let m = data.durating / 60
                        let s = data.durating % 60
                        let formattedTime = String(format: "%01d:%02d", m, s)

                        Text("\(formattedTime)")
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    .hoverRadiusEffect(10)
                }
            }
    }

    // MARK: 歌曲标签

    private struct TagView: View {
        private let text: String
        private let color: Color

        init(_ text: String, _ color: Color) {
            self.text = text
            self.color = color
        }

        var body: some View {
            Text(text)
                .padding(.horizontal, 5)
                .padding(.vertical, 1)
                .background(color)
                .cornerRadius(4)
        }
    }
}

#Preview {
    RecommentMusicView()
}
