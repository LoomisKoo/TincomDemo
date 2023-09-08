//
//  GameVideoView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/1.
//

import AVKit
import SwiftUI

// MARK: 游戏视频播放View

struct GameVideoView: View {
    private static let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video_game", ofType: "mp4")!))

    /// 显示/隐藏UI
    @State private var isShow = true

    private let vm = GameVideoVM()

    @Environment(\.presentationMode) var presentationMode

    @State private var redTeamData: [GameHeroInfoData] = []
    @State private var blueTeamData: [GameHeroInfoData] = []

    init(isShow: Bool = false, redTeamData: [GameHeroInfoData]? = nil, blueTeamData: [GameHeroInfoData]? = nil) {
    }

    var body: some View {
        VideoPlayer(player: Self.player)
//            .navigationBarBackButtonHidden()
            .edgesIgnoringSafeArea(.all)
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                Self.player.play()
                redTeamData = vm.getRedTeamList()
                blueTeamData = vm.getBlueTeamList()

                // 在页面出现时，创建一个定时器，3秒后更新 isShow
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    isShow = true // 更新 isShow
                }

//                Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
//                    isShow.toggle()
//                }
//
//                // 在页面出现时，创建一个定时器，3秒后更新 isShow
//                Timer.scheduledTimer(withTimeInterval: 8, repeats: false) { _ in
//                    isShow.toggle()
//                }
//
//                // 在页面出现时，创建一个定时器，3秒后更新 isShow
//                Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
//                    isShow.toggle()
//                }
//
//                // 在页面出现时，创建一个定时器，3秒后更新 isShow
//                Timer.scheduledTimer(withTimeInterval: 20, repeats: false) { _ in
//                    isShow.toggle()
//                }
//
//                // 在页面出现时，创建一个定时器，3秒后更新 isShow
//                Timer.scheduledTimer(withTimeInterval: 23, repeats: false) { _ in
//                    isShow.toggle()
//                }
            }

            .onDisappear {
                Self.player.pause()
                Self.player.seek(to: .zero)
            }

            .onTapGesture {
                isShow.toggle()
            }

            .ornament(attachmentAnchor: .scene(.top)) {
                // MARK: 顶部信息栏

                GameVideoTopBarView($isShow)
                    .padding(.bottom, 100)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            .ornament(attachmentAnchor: .scene(.leading)) {
                // MARK: 左侧边栏玩家信息

                VStack {
                    ForEach(blueTeamData.indices, id: \.self) { index in
                        let data = blueTeamData[index]
                        LeftPlayerInfoView(index: index, onShowEvent: $isShow, playerInfo: data)
                    }
                }
                .padding(.trailing, 180)
            }
            .ornament(attachmentAnchor: .scene(.trailing)) {
                // MARK: 右侧边栏玩家信息

                VStack {
                    ForEach(redTeamData.indices, id: \.self) { index in
                        let data = redTeamData[index]
                        RightPlayerInfoView(index: index, onShowEvent: $isShow, playerInfo: data)
                    }
                }
                .padding(.leading, 180)
            }
            .ornament(attachmentAnchor: .scene(.bottom)) {
                // MARK: 底部栏

                GameVideoBottomBar($isShow)
                    .padding(.top, 330)
            }
    }
}

#Preview {
    GameVideoView()
}
