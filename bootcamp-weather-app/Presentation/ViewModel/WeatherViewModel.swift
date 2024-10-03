//
//  WeatherViewModel.swift
//  bootcamp-weather-app
//
//  Created by T19757 on 3/10/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var city: City?
    @Published var tomorrowWeather: Weather?
    @Published var todayWeather: Weather?
    @Published var fridayWeather: Weather?
    
    private let service = WeatherService()
    
    var weatherTodayDescription: String {
        if tomorrowWeather?.type == "rain" {
            return "It's a sunny day."
        } else {
            return "It's a rainy day."
        }
    }
    
    var currentTime: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }

    func getWeatherInfo() async {
        do {
            self.city = try await service.fetchCity("San Francisco")
        } catch let error {
        }
    }
    
}
