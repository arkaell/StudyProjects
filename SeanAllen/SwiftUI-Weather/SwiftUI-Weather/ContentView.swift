//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by David Liongson on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {    
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Quezon City, PH")
                
                WeatherDetailView(weatherImageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: 28,
                                  weatherImageSize: 180,
                                  temperatureTextSize: 70)
                    
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", weatherImageName: "cloud.sun.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "WED", weatherImageName: "sun.max.fill", temperature: 29)
                    WeatherDayView(dayOfWeek: "THU", weatherImageName: "sunset.fill", temperature: 24)
                    WeatherDayView(dayOfWeek: "FRI", weatherImageName: "snow", temperature: 7)
                    WeatherDayView(dayOfWeek: "SAT", weatherImageName: "wind", temperature: 11)
                }
                
                Spacer()
                
                WeatherDayButton(isNight: $isNight)
                
                Spacer()
            }
            
        }
    }
}
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDetailView: View {
    var weatherImageName: String
    var temperature: Int
    var weatherImageSize: CGFloat
    var temperatureTextSize: CGFloat
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherImageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .red, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: weatherImageSize, height: weatherImageSize)
            
            Text("\(temperature)º")
                .font(.system(size: temperatureTextSize, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weatherImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            WeatherDetailView(weatherImageName: weatherImageName, temperature: temperature, weatherImageSize: 40, temperatureTextSize: 24)
        }
        
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherDayButton: View {
    @Binding var isNight: Bool
    var body: some View {
        Button {
            isNight.toggle()
        } label: {
            Text("Change Day Time")
                .frame(width: 280, height: 50)
                .background(Color.white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
    }
}
