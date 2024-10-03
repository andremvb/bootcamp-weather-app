//
//  WeatherViewModel.swift
//  bootcamp-weather-app
//
//  Created by T19757 on 3/10/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var city: City?
    private let service = WeatherService()
    
    var weatherTodayDescription: String {
        "It's a sunny day."
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
