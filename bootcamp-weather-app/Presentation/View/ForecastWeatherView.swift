//
//  ForecastWeather.swift
//  bootcamp-weather-app
//
//  Created by T19757 on 3/10/24.
//

import SwiftUI
import URLImage

struct ForecastWeatherView: View {
    private let weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }

    var body: some View {
         VStack {
             if let url = URL(string: "https:" + weather.icon) {
                 URLImage(url){ image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 28)
                 }
             }
             
             Text(String(format: weather.temperature))
                 .font(.system(size: 18))
                 .foregroundColor(.white)
             
             Text(weather.date)
                 .font(.system(size: 20))
                 .foregroundColor(.white)
         }
     }
}

