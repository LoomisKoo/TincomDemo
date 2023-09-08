//
//  TincomApp.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/6/23.
//

import SwiftUI

@main
struct TincomApp: App {
    @State private var currentStyle: ImmersionStyle = .mixed

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 1300, minHeight: 800)
        }
        .windowStyle(.plain)
        .defaultSize(width: 1200, height: 1300)
        .windowResizability(.contentSize)

        // 天气场景
        ImmersiveSpace(id: "ImmersiveWeather", for: WeatherOption.self) { type in
            if let typeValue = type.wrappedValue {
                ImmersiveView(weatherType: typeValue)
            }

        }.immersionStyle(selection: $currentStyle, in: .mixed, .progressive, .full)

        // 新窗口
        WindowGroup(id: "newWindow") {
            NavigationStack {
                VStack {
                    Text("这是一个新的窗口")
                        .font(.extraLargeTitle)
                }
            }
        }
        .defaultSize(width: 404, height: 20, depth: 0, in: .meters)

        // 苹果手表窗口
        WindowGroup("3D Model", id: "AppleWatchWindow", for: Int.self) { _ in
            WatchModel3DView(400)
        }
        .defaultSize(width: 0.4, height: 0.4, depth: 0, in: .meters)
    }
}
