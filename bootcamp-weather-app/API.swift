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
    let todayWeather: Weather
    let tomorrowWeather: Weather
    let dayAfterTomorrowWeather: Weather
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
        self.type = apiWeather.condition.text
    }

    init(futureWeather: FutureWeather, date: String) {
        // TODO: Remove !
        let day = futureWeather.forecast.forecastday.first!
        self.temperature = String(format: "%.1f", day.day.avgtempC) + "/" + String(format: "%.1f", day.day.avgtempF)
        self.wind = ""
        self.humidity = ""
        self.date = date
        self.temperatureF = ""
        self.icon = day.day.condition.icon
        self.type = day.day.condition.text
    }
}

