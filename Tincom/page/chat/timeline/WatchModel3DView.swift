//
//  WatchModel3DView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/9/2.
//

import SwiftUI

import RealityKit
import RealityKitContent

struct WatchModel3DView: View {
    @State private var rotationAngle: Double = 0.0

    private var frameSize: CGFloat

    private let url = "https://www.apple.com/105/media/us/apple-watch-ultra/2022/4d9e62e1-fe94-4bb9-abbe-0b8c9626a304/ar/watch_ultra_I_alpine_loop_orange_us_ios15.usdz"

    init(_ frameSize: CGFloat) {
        self.frameSize = frameSize
    }

    var body: some View {
        /// model
        Model3D(url: URL(string: url)!) { model in
            model
                .resizable()
                .rotation3DEffect(.degrees(rotationAngle), axis: .y)
                .scaledToFit()
                .frame(width: frameSize - 100)
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
    WatchModel3DView(400)
}
