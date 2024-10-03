//
//  ContentView.swift
//  bootcamp-weather-app
//
//  Created by Andre Valdivia on 3/10/24.
//

import SwiftUI

struct ContentView: View {

    let service = WeatherService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .task {
                    do {
                        let cityData = try await service.fetchCity("San Francisco")
                        print(cityData)
                    } catch {
                        print(error)
                    }

                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
