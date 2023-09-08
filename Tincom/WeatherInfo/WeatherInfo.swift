//
//  BaseWeatherInfo.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/19.
//

import Foundation

class WeatherInfo {
    func getWeatherName() -> String { return "" }
    func getImmersiveId() -> String { return "" }
    func getSelectedImage() -> String { return "" }
    func getUnSelectedImage() -> String { return "" }
}


// MARK: 晴天信息

class SunnyWeatherInfo: WeatherInfo {
    override func getWeatherName() -> String {
        return "Sunny"
    }

    // sunny状态下不用打开沉浸式，所以这里的id是空串
    override func getImmersiveId() -> String {
        return ""
    }

    override func getSelectedImage() -> String {
        return "cloud.sun.fill"
    }

    override func getUnSelectedImage() -> String {
        return "cloud.sun"
    }
}
