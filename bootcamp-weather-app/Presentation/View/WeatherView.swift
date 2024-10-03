//
//  WeatherView.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {

            HStack(alignment: .center) {
                Spacer()
                
                Text(viewModel.currentTime)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                    
                }
            
            }
            .padding(.horizontal)
            
            VStack {
                Text(viewModel.city?.name ?? "")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .bold()
                
                Text(viewModel.city?.date ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            
            Spacer()

            if let city = viewModel.city {
                TodayWeatherView(city: city)
            }
            
            Spacer()

            HStack(spacing: 30) {
                
                if let tomorrowWeather = viewModel.city?.tomorrowWeather{
                    ForecastWeatherView(weather: tomorrowWeather)
                }
                
                if let todayWeather = viewModel.city?.todayWeather {
                    ForecastWeatherView(weather: todayWeather)
                }
                
                if let fridayWeather = viewModel.city?.dayAfterTomorrowWeather {
                    ForecastWeatherView(weather: fridayWeather)
                }
            }
            .font(.subheadline)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.top, 60)
        .background {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x2762D4), Color(hex: 0x2762D4)]),
                           startPoint: .trailing, endPoint: .leading)
        }
        .ignoresSafeArea(.all)
        .task {
            await viewModel.getWeatherInfo()
        }
    }

}

#Preview {
    WeatherView()
}


