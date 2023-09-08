//
//  ContentView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/6/23.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    private let itemRadius: CGFloat = 20

    private let menuItems = [
//        MenuItem(title: "照片墙", destination: AnyView(PictureWall())),
        MenuItem(title: "音乐", destination: AnyView(MusicView())),
        MenuItem(title: "游戏视频", destination: AnyView(GameVideoView())),
        MenuItem(title: "appleWatch", destination: AnyView(AppleDevicePreView())),
        MenuItem(title: "聊天", destination: AnyView(MRChatView())),
        MenuItem(title: "仙森", destination: AnyView(MagaxyView())),
    ]

    @State private var selectedItem: MenuItem?

    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: 主菜单列表

                gridView()
                    .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .bottomOrnament) {
                    WeatherMenuView()
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                }
            }
            .navigationTitle("Home")
        }
        .glassBackgroundEffect(in: .rect(cornerRadius: 20))
    }

    private func gridView() -> some View {
        return
            LazyVGridView(columnsCount: 4, hSpacing: 0, vSpacing: 0) {
                ForEach(menuItems) { menuItem in
                    NavigationLink(
                        destination: menuItem.destination,
                        label: {
                            Text(menuItem.title)
                                .font(.title)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(minHeight: 0)
                                .aspectRatio(2, contentMode: .fit)
                                .background(.fill.tertiary)
                                .cornerRadius(itemRadius / 2)
                                .padding(itemRadius / 2)
                                .hoverRadiusEffect(itemRadius)
                        })
                        .buttonStyle(.plain)
                }
            }
    }

    /// 菜单item
    private struct MenuItem: Identifiable {
        let id = UUID()
        let title: String
        var destination: AnyView
    }
}

#Preview {
    ContentView()
}
