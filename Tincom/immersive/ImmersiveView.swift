//
//  ImmersiveView.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/14.
//

import Foundation
import RealityKit
import RealityKitContent
import SwiftUI

// MARK: 沉浸式场景

struct ImmersiveView: View {
    private var weatherType: WeatherOption

    init(weatherType: WeatherOption) {
        self.weatherType = weatherType
    }

    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: weatherType.rawValue, in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}

#Preview {
    ImmersiveView(weatherType: WeatherOption.SUNNY).previewLayout(.sizeThatFits)
}
