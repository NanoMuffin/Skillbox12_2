//
//  DataLoader.swift
//  Skillbox12_2
//
//  Created by Александр Сорока on 03.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import Foundation

//protocol dataLoaderDelegate{
//    func load( data: WeatherDataClass) }

class dataLoader{
    
//    var delegate: dataLoaderDelegate?
   
    
    var Url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow,ru&APPID=f2a7ca3bd41dfa2efab0ad667aafe1df")!
    
    func loadData(complition: @escaping (WeatherDataClass?) -> Void){
        let url = Url
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let dataReturned = data {
            if let json = try? JSONSerialization.jsonObject(with: dataReturned, options: .allowFragments),
                
                let JsonDict = json as? NSDictionary{
                    if let weather = WeatherDataClass(weatherData: JsonDict) {
                        print("city: \(weather.cityName), temp: \(weather.currentWeather), description: \(weather.weatherDescription)")
                        DispatchQueue.main.async {
                            complition(weather) }
                }
                
    } else {return} }}
                
            task.resume()
        
         
    }
    
}
//complition: @escaping (WeatherDataClass?) -> Void

class dataLoader2 {
    
    let adress = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=55.7522&lon=37.6156&appid=14a0d2798906ce419001ba9975479d05")!
    
    func loadData(complition: @escaping (NewWeatherDataClass?) -> Void) {
        let url = adress
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let dataReturned = data {
        if let json = try? JSONSerialization.jsonObject(with: dataReturned, options: .allowFragments),
            let JsonDict = json as? NSDictionary{
            if let weather = NewWeatherDataClass(weatherData: JsonDict) {
                DispatchQueue.main.async {
                    complition(weather)}
            }
            
            }
        
        } else { return }
    
    
        }
        task.resume()
    }}
