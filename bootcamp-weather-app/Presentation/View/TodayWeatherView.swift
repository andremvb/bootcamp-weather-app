//
//  TodayWeather.swift
//  bootcamp-weather-app
//
//  Created by T19757 on 3/10/24.
//

import SwiftUI
import URLImage

struct TodayWeatherView: View {
    private let city: City
    
    init(city: City) {
        self.city = city
    }

    var body: some View {
        VStack(spacing: 10) {
            
            if let url = URL(string: "https:" + (city.mainIcon)) {
                URLImage(url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                }
            }
            
            Text(String(format: city.temperature))
                .font(.system(size: 57))
                .foregroundColor(.white)
                .bold()
            
            Text(city.description)
                .font(.system(size: 22))
                .foregroundColor(.white)
        }
        
        HStack(spacing: 40) {
            HStack {
                Image(systemName: "wind.snow")
                    .foregroundColor(.white)
                
                Text(city.wind)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            HStack {
                Image(systemName: "drop")
                    .foregroundColor(.white)
                
                Text(city.humidity)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
        }
        .font(.headline)
     }
}
