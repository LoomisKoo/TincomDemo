//
//  WeatherInfo.swift
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
        return "cloud.sun.fill"
    }
}

// MARK: 雨天信息

class RainWeatherInfo: WeatherInfo {
    override func getWeatherName() -> String {
        return "Rain"
    }

    // sunny状态下不用打开沉浸式，所以这里的id是空串
    override func getImmersiveId() -> String {
        return "ImmersiveRain"
    }

    override func getSelectedImage() -> String {
        return "cloud.rain"
    }

    override func getUnSelectedImage() -> String {
        return "cloud.rain"
    }
}

// MARK: 下雪信息

class SnowWeatherInfo: WeatherInfo {
    override func getWeatherName() -> String {
        return "Snow"
    }

    // sunny状态下不用打开沉浸式，所以这里的id是空串
    override func getImmersiveId() -> String {
        return "ImmersiveSnow"
    }

    override func getSelectedImage() -> String {
        return "snowflake"
    }

    override func getUnSelectedImage() -> String {
        return "snowflake"
    }
}



// MARK: 烟花信息

class FireworkWeatherInfo: WeatherInfo {
    override func getWeatherName() -> String {
        return "Firework"
    }

    // sunny状态下不用打开沉浸式，所以这里的id是空串
    override func getImmersiveId() -> String {
        return "ImmersiveFirework"
    }

    override func getSelectedImage() -> String {
        return "party.popper"
    }

    override func getUnSelectedImage() -> String {
        return "party.popper"
    }
}
