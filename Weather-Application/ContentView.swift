//
//  ContentView.swift
//  Weather-Application
//
//  Created by shreenidhi vm on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight:Bool = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityText: "Bangalore,KA")
                BigView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: "28°")
                HorizontalWeatherView()
                Spacer()
                Button{
                    isNight.toggle()
                    
                }label: {
                    ButtonView(text: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
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

struct WeatherDayView: View {
    var dayOfTheWeek:String
    var weatherImage:String
    var temperature:Int
    var body: some View {
        VStack{
            Text("\(dayOfTheWeek)")
                .font(.system(size: 19,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: "\(weatherImage)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50,height: 50)
            Text("\(temperature)")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight:Bool
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    @State var cityText:String
    var body: some View {
        Text(cityText)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct BigView: View {
     var imageName:String
     var temperature:String
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("27°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
            
            
            
        }
        .padding(.bottom,40)
    }
}

struct HorizontalWeatherView: View {
    var body: some View {
        HStack(spacing: 20){
            WeatherDayView(dayOfTheWeek: "TUE",
                           weatherImage: "cloud.sun.fill",
                           temperature: 27)
            WeatherDayView(dayOfTheWeek: "WED",
                           weatherImage: "sun.max.fill",
                           temperature: 30)
            WeatherDayView(dayOfTheWeek: "THU",
                           weatherImage: "wind.snow",
                           temperature: 25)
            WeatherDayView(dayOfTheWeek: "FRI",
                           weatherImage: "sunset.fill",
                           temperature: 22)
            WeatherDayView(dayOfTheWeek: "SAT",
                           weatherImage: "snow",
                           temperature: 20)
        }
    }
}

struct ButtonView: View {
     var text:String
     var textColor:Color
     var backgroundColor:Color
    var body: some View {
        
            Text("Change Day Time")
                .frame(width: 280,height: 50)
                .background(backgroundColor)
                .font(.system(size:20,weight: .bold,design: .default))
                .foregroundColor(textColor)
                .cornerRadius(10)
        
    }
}
