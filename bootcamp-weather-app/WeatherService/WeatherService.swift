//
//  WeatherService.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import Foundation

struct WeatherService {
    private let token = "71592f6f219c4dc2bf8202603240310"
    private let session = URLSession.shared
    private let baseURL = "https://api.weatherapi.com/v1/"

    func fetchCity(_ city: String) async throws -> City {
        // TODO make this calls not waiting ? :v
        let currentData = try await fetchCurrent()
        // TODO: Un hardcode
//        let tomorrowData = try await fetchFuture(date: "2024-11-04")
//        let oneDayAfterData = try await fetchFuture(date: "2024-11-05")

        let currentWeather = Weather(
            apiWeather: currentData.current,
            date: "Today"
        )

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ""
        dateFormatter.string(from: date)

        return City(
            date: dateFormatter.string(from: date),
            name: currentData.location.name,
            mainIcon: currentWeather.icon,
            temperature: currentWeather.temperatureF,
            description: "Some description",
            wind: currentWeather.wind,
            humidity: currentWeather.humidity,
            weather: [
                currentWeather,
                currentWeather,
                currentWeather
            ]
        )
    }

    private func fetchCurrent() async throws -> CurrentWeather {
        let string = baseURL + "current.json"
        // TODO: Remove !
        var components = URLComponents(string: string)!
        components.queryItems = [
            URLQueryItem(name: "key", value: token),
            URLQueryItem(name: "q", value: "San Francisco"),
            URLQueryItem(name: "aqi", value: "no")
        ]
        let (data, _ ) = try await session.data(from: components.url!)
        let decoder = JSONDecoder()
        let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
        return currentWeather
    }

    // date format = 2024-11-02
    private func fetchFuture(date: String) async throws -> CurrentWeather {
        let string = baseURL + "future.json"
        // TODO: Remove !
        var components = URLComponents(string: string)!
        components.queryItems = [
            URLQueryItem(name: "key", value: token),
            URLQueryItem(name: "q", value: "San Francisco"),
            URLQueryItem(name: "dt", value: date)
        ]
        let (data, _ ) = try await session.data(from: components.url!)
        let decoder = JSONDecoder()
        let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
        return currentWeather
    }
}
