//
//  ForecastWeather.swift
//  bootcamp-weather-app
//
//  Created by T19757 on 3/10/24.
//

import SwiftUI

struct ForecastWeatherView: View {
    private let weather: Weather?
    
    init(weather: Weather?) {
        self.weather = weather
    }

    var body: some View {
         VStack {
             Image(systemName: weather?.type == "rain" ? "cloud.rain.fill" : "sun.max.fill")
                 .foregroundColor(.white)
             
             Text(String(format: "%@°/%@F", weather?.wind ?? "", weather?.humidity ?? ""))
                 .font(.system(size: 18))
                 .foregroundColor(.white)
             
             Text(weather?.date ?? "")
                 .font(.system(size: 20))
                 .foregroundColor(.white)
         }
     }
}

