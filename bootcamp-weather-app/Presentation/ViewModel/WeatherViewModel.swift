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

    func getWeatherInfo() {
      /*  city = City(name: "San Francisco _")
        tomorrowWeather = Weather(type: .rain, wind: "82.4", humidity: "86", date: "Tomorrow")
        todayWeather = Weather(type: .sunny, wind: "82.4", humidity: "86", date: "Today")
        fridayWeather = Weather(type: .rain, wind: "82.4", humidity: "86", date: "Friday")*/
    }
    
}
