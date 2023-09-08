//
//  MagaxyView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/9/7.
//

import SwiftUI

// MARK: 仙森主页

struct MagaxyView: View {
    var body: some View {
        TabView {
            /// 地图
            CommonTabItemView(text: "地图", icon: "globe.americas.fill", tag: 1) {
                Text("map")
            }

            ///
            CommonTabItemView(text: "通讯录", icon: "person", tag: 2) {
                Text("推荐")
            }
        }
    }
}


#Preview {
    MagaxyView()
}
