//
//  CurrentWeatherData.swift
//  testAPI
//
//  Created by Alisa Ts on 26.11.2021.
//


struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]

}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    
//    enum CodingKeys: String, CodingKeys {
//        case temp
//        case feelsLike = "feels_like"
//    }
}

struct Weather: Codable {
    let id: Int
}
