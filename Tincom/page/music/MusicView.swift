//
//  MusicView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/20.
//

import Foundation
import SwiftUI

// MARK: 音乐首页

struct MusicView: View {
    /// 侧边栏当前选中的菜单
    @State private var curSlideMenu = MusicSideBarMenuType.RECOMMENT

    var body: some View {
        tabView()
            .padding(0)
            .frame(maxWidth: .infinity)
//            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    /// toolbar左边部分 包括头像、昵称等
                    MusicTopBarLeftView()
                }

                ToolbarItem(placement: .principal) {
                    /// 歌词
                    MusicLyricView()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    /// toolbar右边部分 包括搜索、设置、消息、皮肤等按钮
                    MusicTopBarRightView()
                }

                ToolbarItem(placement: .bottomOrnament) {
                    MusicToolBar()
                }
            }
    }

    // MARK: tabView

    private func tabView() -> some View {
        return TabView(selection: $curSlideMenu) {
            /// 推荐音乐
            RecommentMusicView()
                .tabItem { Label(
                    title: { Text("推荐音乐") },
                    icon: { Image(systemName: "music.note.list") })
                }
                .tag(MusicSideBarMenuType.RECOMMENT)

            /// 视频
            MusicVideoView()
                .tabItem { Label(
                    title: { Text("视频") },
                    icon: { Image(systemName: "video.fill") })
                }
                .tag(MusicSideBarMenuType.VIDEO)

            /// 喜欢的音乐
            FavoriteMusicListView()
                .tabItem { Label(
                    title: { Text("喜欢的音乐") },
                    icon: { Image(systemName: "heart.fill") })
                }
                .tag(MusicSideBarMenuType.FAVORITE)

            /// 最近播放
            RecentlyPlayMusiListView()
                .tabItem { Label(
                    title: { Text("最近播放") },
                    icon: { Image(systemName: "clock.fill") })
                }
                .tag(MusicSideBarMenuType.RECENTLY)
        }
    }
}

// MARK: 侧边导航栏功能类型

private enum MusicSideBarMenuType: String {
    case RECOMMENT = "推荐"
    case PODCAST = "播客"
    case VIDEO = "视频"
    case FOLLOW = "关注"
    case FAVORITE = "喜欢的音乐"
    case RECENTLY = "最近播放"
    case DOWNLOAD = "下载管理"
}

#Preview {
    MusicView()
}
