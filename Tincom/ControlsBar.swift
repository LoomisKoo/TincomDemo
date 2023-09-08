//
//  ControlsBar.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/14.
//

import Foundation
import RealityKit
import RealityKitContent
import SwiftUI

struct WeatherMenuView: View {
    @State var isSnow = false
    @State var isShowPictureWall = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        HStack {
            Toggle("sonw", isOn: $isSnow)
                .toggleStyle(.button)
                .onChange(of: isSnow) { _, newValue in
                    openOrDismissImmersive(newValue, "ImmersiveSpace")
                }
        }
        .padding()
        .glassBackgroundEffect()
    }

    func openOrDismissImmersive(_ newValue: Bool, _ spaceName: String) {
        Task {
            if newValue {
                await openImmersiveSpace(id: spaceName)
            } else {
                await dismissImmersiveSpace()
            }
        }
    }
}

#Preview {
    WeatherMenuView()
}
