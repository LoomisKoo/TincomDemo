//
//  RecommentVideoView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/24.
//

import Foundation
import SwiftUI

struct MusicVideoView: View {
    private let vm = MusicVideoVM()
    @State private var selectedText: String = "MV"

    @State var dataList = MusicVideoVM().getVideoList()

    var body: some View {
        ScrollView {
            header()
                .padding(.top, 10)
                .padding(.horizontal, 30)
            gridView(dataList)
                .padding(.horizontal, 20)
                .padding(.bottom, 30) /// 避免底部被toolBar挡住
        }
        .onAppear {
            self.dataList = vm.getVideoList()
        }
    }

    private func header() -> some View {
        return HStack(spacing: 10) {
            /// 全部视频 按钮
            Button(action: {
            }, label: {
                HStack(spacing: 5) {
                    Text("全部视频")
                        .font(.title2)
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                }
            })

            Spacer()

            TabButton("现场", $selectedText)
            TabButton("翻唱", $selectedText)
            TabButton("舞蹈", $selectedText)
            TabButton("MV", $selectedText)
            TabButton("国风", $selectedText)
            TabButton("欧美", $selectedText)
            TabButton("日韩", $selectedText)
            TabButton("游戏", $selectedText)
        }
    }
}

private struct TabButton: View {
    private let text: String

    @Binding var selectedText: String

    init(_ text: String, _ selectedText: Binding<String>) {
        self.text = text
        _selectedText = selectedText
    }

    var body: some View {
        Button(action: {
            selectedText = text
        }, label: {
            Text(text)
                .font(.system(size: 20))
                .padding(5)
                .padding(.horizontal, 4)
                .background(text == selectedText ? Color.blue : Color.gray.opacity(0.5))
                .foregroundColor(.white.opacity(0.8))
                .cornerRadius(5)
        })
        .hoverRadiusEffect(5)
    }
}

private func gridView(_ dataList: [MusicVideoData]) -> some View {
    return LazyVGridView(columnsCount: 3, hSpacing: 0, vSpacing: 0) {
        ForEach(dataList, id: \.self) { item in
            VStack(alignment: .leading) {
                // MARK: 封面图

                ZStack(alignment: .trailing) {
                    AsyncImage(url: URL(string: item.coverUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 0)
                    .aspectRatio(2 / 1, contentMode: .fit)
                    .cornerRadius(10)

                    VStack {
                        // MARK: 播放量

                        HStack(alignment: .center, spacing: 2) {
                            Image(systemName: "play")
                                .resizable()
                                .aspectRatio(0.8, contentMode: .fit)
                                .frame(width: 12, height: 12)

                            let count = item.playCount

                            let playCount: String = count < 10000 ? "\(count)" :
                                "\(count / 10000)万"

                            Text(playCount)
                        }
                        .padding(.top, 8)
                        .padding(.trailing, 8)

                        Spacer()

                        // MARK: 时长

                        let m = item.videoLength / 60
                        let s = item.videoLength % 60
                        let length = String(format: "%01d:%02d", m, s)

                        Text(length)
                            .bold()
                            .padding(8)
                    }
                }

                // MARK: 视频名称

                Text(item.videoName)
                    .font(.title)
                Text(item.author).font(.title2)
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(10)
            .hoverRadiusEffect(20)
            .padding(5)
        }
    }
}

#Preview {
    MusicVideoView()
}
