//
//  WeatherService.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import Foundation

struct WeatherService {

    enum ServiceError: Error {
        case badUrl
        case badDateConversion
    }

    private let token = "71592f6f219c4dc2bf8202603240310"
    private let session = URLSession.shared
    private let baseURL = "https://api.weatherapi.com/v1/"

    func fetchCity(_ city: String) async throws -> City {
        let currentData = try await fetchCurrent()
        let tomorrowData = try await fetchFuture(date: dateAfter(days: 1))
        let oneDayAfterDateString = try dateAfter(days: 2)
        let oneDayAfterData = try await fetchFuture(date: oneDayAfterDateString)

        let currentWeather = Weather(
            apiWeather: currentData.current,
            date: "Today"
        )
        let tomorrowWeather = Weather(futureWeather: tomorrowData, date: "Tomorrow")
        let oneDayAfterWeather = Weather(
            futureWeather: oneDayAfterData,
            date: try getDayName(dateString: oneDayAfterDateString)
        )

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateFormatter.string(from: date)

        return City(
            date: dateFormatter.string(from: date),
            name: currentData.location.name,
            mainIcon: currentWeather.icon,
            temperature: currentWeather.temperatureF,
            description: currentWeather.type,
            wind: currentWeather.wind,
            humidity: currentWeather.humidity,
            todayWeather: currentWeather,
            tomorrowWeather: tomorrowWeather,
            dayAfterTomorrowWeather: oneDayAfterWeather
        )
    }

    private func fetchCurrent() async throws -> CurrentWeather {
        let string = baseURL + "current.json"
        guard var components = URLComponents(string: string) else { throw ServiceError.badUrl }
        components.queryItems = [
            URLQueryItem(name: "key", value: token),
            URLQueryItem(name: "q", value: "San Francisco"),
            URLQueryItem(name: "aqi", value: "no")
        ]
        guard let url = components.url else { throw ServiceError.badUrl }
        let (data, _ ) = try await session.data(from: url)
        let decoder = JSONDecoder()
        let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
        return currentWeather
    }

    // date format = 2024-11-02
    private func fetchFuture(date: String) async throws -> FutureWeather {
        let string = baseURL + "future.json"
        guard var components = URLComponents(string: string) else { throw ServiceError.badUrl }
        components.queryItems = [
            URLQueryItem(name: "key", value: token),
            URLQueryItem(name: "q", value: "San Francisco"),
            URLQueryItem(name: "dt", value: date)
        ]
        guard let url = components.url else { throw ServiceError.badUrl }
        let (data, _ ) = try await session.data(from: url)
        let decoder = JSONDecoder()
        let futureWeather = try decoder.decode(FutureWeather.self, from: data)
        return futureWeather
    }

    private func dateAfter(days: Int) throws -> String {
        let today = Date()
        let calendar = Calendar.current
        // TODO: FIX! Cannot add date because API only supports 14 to 300 days. Error:
        // dt parameter should be in yyyy-MM-dd format and between 14 days and 300 days from today in the future
        guard let tomorrow = calendar.date(byAdding: .month, value: days, to: today) else {
            throw ServiceError.badDateConversion
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: tomorrow)
    }

    private func getDayName(dateString: String) throws -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            throw ServiceError.badDateConversion
        }
        let dayNameFormatter = DateFormatter()
        dayNameFormatter.dateFormat = "EEEE"
        return dayNameFormatter.string(from: date)
    }
}
