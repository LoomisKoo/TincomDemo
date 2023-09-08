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

// MARK: 天气的菜单（按钮）view

struct WeatherMenuView: View {
    @State private var selectedWether = WeatherOption.SUNNY

    private var wearthInfo = SunnyWeatherInfo()

    @State private var oldScenephase: ScenePhase = .inactive

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    @Environment(\.scenePhase) private var scenephase

    var body: some View {
        HStack(spacing: 20) {
            ForEach(WeatherOption.allCases, id: \.self) { weather in
                WeatherRadioButton(
                    weather: weather,
                    isSelected: weather == selectedWether,
                    callback: selectedWeather
                )
            }
        }
        /// 在这里监听scenephase，跟在TincomApp里的windowGroup监听会有区别
        /// 后者监听会有background状态，而这里没有
        .onChange(of: scenephase) { oldValue, newValue in
            self.oldScenephase = oldValue
            if newValue == .active {
                selectedWeather(weather: selectedWether)
            }
        }
    }

    func selectedWeather(weather: WeatherOption) {
        switchWeather(curWeather: selectedWether, newWeather: weather)
    }

    // 切换天气
    func switchWeather(
        curWeather: WeatherOption,
        newWeather: WeatherOption) {
        if curWeather == newWeather && oldScenephase == .active {
            return
        }

        Task {
            // sunny是无沉浸式的状态，所以当前非sunny状态下需要关闭
            // TODO: 这里应该判断有没有打开沉浸式
            if curWeather != WeatherOption.SUNNY {
                await dismissImmersiveSpace()
            }
            // 若新状态是sunny，则不打开沉浸式
            if newWeather != WeatherOption.SUNNY {
                await openImmersiveSpace(id: "ImmersiveWeather", value: newWeather)
            }
        }

        withAnimation {
            selectedWether = newWeather
        }
    }
}

// MARK: 天气枚举

enum WeatherOption: String, CaseIterable, Decodable, Encodable {
    /// 这几个value对应entity的name
    case SUNNY = "sunny"
    case SNOW = "SceneSnow"
    case RAIN = "SceneRain"
    case FIREWORK = "SceneFirework"
}

// MARK: 天气枚举

extension WeatherOption {
    func getWaetherInfo() -> WeatherInfo {
        switch self {
        case .SUNNY: SunnyWeatherInfo()
        case .RAIN: RainWeatherInfo()
        case .SNOW: SnowWeatherInfo()
        case .FIREWORK: FireworkWeatherInfo()
        }
    }
}

// MARK: 天气按钮

private struct WeatherRadioButton: View {
    private let weather: WeatherOption
    private let isSelected: Bool
    private let callback: (WeatherOption) -> Void

    private let buttonCorner: CGFloat = 20

    init(weather: WeatherOption, isSelected: Bool, callback: @escaping (WeatherOption) -> Void) {
        self.weather = weather
        self.isSelected = isSelected
        self.callback = callback
    }

    var body: some View {
        let selectImg = weather.getWaetherInfo().getSelectedImage()

        Image(systemName: selectImg)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 34, height: 34)
            .foregroundColor(Color.white)
            .padding(10)
            .background(isSelected ? Color.blue.opacity(0.9) : Color.gray.opacity(0.5))
            .clipShape(Circle())
            .hoverCircleEffect()
            .onTapGesture {
                callback(weather)
            }
    }
}

#Preview {
    WeatherMenuView()
}
