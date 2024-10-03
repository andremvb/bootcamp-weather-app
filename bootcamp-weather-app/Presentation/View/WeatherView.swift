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
                
                Text("Tuesday, 12 Apr 2022")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            
            Spacer()

            todayWeather()
            
            Spacer()

            HStack(spacing: 30) {
                ForecastWeatherView(weather: viewModel.tomorrowWeather)
                ForecastWeatherView(weather: viewModel.todayWeather)
                ForecastWeatherView(weather: viewModel.fridayWeather)
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
    
    @ViewBuilder
    func todayWeather() -> some View {
        
        VStack(spacing: 10) {
            Image(systemName: "sun.max.fill")
                .font(.system(size: 60))
                .foregroundColor(.yellow)
            
            Text(String(format: "%@°F", viewModel.todayWeather?.wind ?? ""))
                .font(.system(size: 57))
                .foregroundColor(.white)
                .bold()
            
            Text(viewModel.weatherTodayDescription)
                .font(.system(size: 22))
                .foregroundColor(.white)
        }
        
        HStack(spacing: 40) {
            HStack {
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.white)
                
                Text("3 mph")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            HStack {
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.white)
                
                Text("60%")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
        }
        .font(.headline)
    }

}

#Preview {
    WeatherView()
}


