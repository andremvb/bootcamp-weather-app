//
//  API.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import Foundation

struct City {
    let date: String
    let name: String
    let mainIcon: String
    let temperature: String
    let description: String
    let wind: String
    let humidity: String
    let weather: [Weather]
}

struct Weather {

    let temperatureF: String
    let temperature: String
    let icon: String
    let wind: String
    let humidity: String
    // Today / Tomorrow / Friday
    let date: String
    let type: String
}

extension Weather {
    init(apiWeather: APIWeather, date: String) {
        self.temperatureF = String(apiWeather.tempF) + "F"
        self.temperature = String(apiWeather.tempC) + "/" + temperatureF
        self.icon = apiWeather.condition.icon
        self.wind = String(format: "%.0f", apiWeather.windMph) + " mph"
        self.humidity = String(apiWeather.humidity) + "%"
        self.date = date
        self.type = ""
    }
}

