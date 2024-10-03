//
//  FutureWeather.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import Foundation

struct FutureWeather: Decodable {
    let forecast: Forecast

    struct Forecast: Decodable {
        let forecastday: [Forecastday]
    }

    struct Forecastday: Decodable {
        let day: Day
    }

    struct Day: Decodable {
        let avgtempC: Double
        let avgtempF: Double
        let condition: WeatherCondition

        enum CodingKeys: String, CodingKey {
            case avgtempC = "avgtemp_c"
            case avgtempF = "avgtemp_f"
            case condition = "condition"
        }
    }
}
