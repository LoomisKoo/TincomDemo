//
//  AppleDeviceView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/17.
//

import RealityKit
import RealityKitContent
import SwiftUI

// MARK: 苹果设备预览

/// 黄色款
private let DEVICE_URL_IWATCH_ULTRA_YELLOW = "https://www.apple.com/105/media/us/apple-watch-ultra/2022/4d9e62e1-fe94-4bb9-abbe-0b8c9626a304/ar/watch_ultra_I_trail_loop_yellow_beige_us_ios15.usdz"

/// 橙色款
private let DEVICE_URL_IWATCH_ULTRA_ORANGE = "https://www.apple.com/105/media/us/apple-watch-ultra/2022/4d9e62e1-fe94-4bb9-abbe-0b8c9626a304/ar/watch_ultra_I_alpine_loop_orange_us_ios15.usdz"

/// 午夜色款
private let DEVICE_URL_IWATCH_ULTRA_MIDNIGHT = "https://www.apple.com/105/media/us/apple-watch-ultra/2022/4d9e62e1-fe94-4bb9-abbe-0b8c9626a304/ar/watch_ultra_I_ocean_band_midnight_us_ios15.usdz"

struct AppleDevicePreView: View {
    @State private var selection: Int = 0
    var body: some View {
        HStack(spacing: 0) {
            Color.clear.overlay {
                Model3DView(DEVICE_URL_IWATCH_ULTRA_YELLOW, "黄色")
            }

            Color.clear.overlay {
                Model3DView(DEVICE_URL_IWATCH_ULTRA_ORANGE, "橙色")
            }

            Color.clear.overlay {
                Model3DView(DEVICE_URL_IWATCH_ULTRA_MIDNIGHT, "午夜色")
            }
        }
    }
}

// MARK: 模型view

struct Model3DView: View {
    @State private var rotationAngle: Double = 0.0

    /// model url
    private let modelUrl: String
    private let modelName: String

    init(_ modelUrl: String, _ modelName: String) {
        self.modelUrl = modelUrl
        self.modelName = modelName
    }

    var body: some View {
        VStack(spacing: 50) {
            /// model
            Model3D(url: URL(string: modelUrl)!) { model in
                model
                    .resizable()
                    .rotation3DEffect(.degrees(rotationAngle), axis: .y)
                    .scaledToFit()
                    .frame(width: 200)
                    .onAppear {
                        startRotationAnimation()
                    }
                    .onDisappear {
                        stopRotationAnimation()
                    }
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 200)
            }

            /// 设备名称
            Text(modelName)
                .font(.extraLargeTitle2)
        }
    }

    private func startRotationAnimation() {
        withAnimation(Animation.linear(duration: 10.0).repeatForever(autoreverses: false)) {
            rotationAngle = 361
        }
    }

    private func stopRotationAnimation() {
        rotationAngle = 0
    }
}

#Preview {
    AppleDevicePreView()
}
