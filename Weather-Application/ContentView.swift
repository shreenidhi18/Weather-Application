//
//  ContentView.swift
//  Weather-Application
//
//  Created by shreenidhi vm on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack{
                CityTextView(cityText: "Bangalore,KA")
                BigView(imageName: "cloud.sun.fill", temperature: "28°")
                HorizontalWeatherView()
                Spacer()
                ButtonView(text: "Change Day Time", textColor: .blue, backgroundColor: .white)
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
    @State var topColor:Color
    @State var bottomColor:Color
    var body: some View {
        LinearGradient(colors: [topColor,bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
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
    @State var imageName:String
    @State var temperature:String
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: "cloud.sun.fill")
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

//struct ButtonView: View {
//    @State var text:String
//    @State var textColor:Color
//    @State var backgroundColor:Color
//    var body: some View {
//        Button{
//            print("tapped")
//        }label: {
//            Text("Change Day Time")
//                .frame(width: 280,height: 50)
//                .background(backgroundColor)
//                .font(.system(size:20,weight: .bold,design: .default))
//                .foregroundColor(textColor)
//                .cornerRadius(10)
//        }
//    }
//}
