//
//  CurrentWeather.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import Foundation

struct CurrentWeather: Decodable {
  let location: Location
  let current: APIWeather
}

struct Location: Decodable {
    let name: String
    let region: String
    let country: String

    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case tzId = "tz_id"
        case name
        case region
        case country
        case lat
        case lon
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

struct APIWeather: Decodable {
  let lastUpdatedEpoch: Int
  let lastUpdated: String
  let tempC: Double
  let tempF: Double
  let condition: WeatherCondition
  let windMph: Double
  let humidity: Int

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case windMph = "wind_mph"
        case condition
        case humidity
        case tempC = "temp_c"
        case tempF = "temp_f"
    }
}

struct WeatherCondition: Decodable {
    let text: String
    let icon: String
    let code: Int
}
