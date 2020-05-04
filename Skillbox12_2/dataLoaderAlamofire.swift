//
//  dataLoaderAlamofire.swift
//  Skillbox12_2
//
//  Created by Александр Сорока on 12.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import Foundation
import Alamofire

open class dataLoaderAlamofire{
    
    func loadData(complition: @escaping (WeatherDataClass?) -> Void){
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=Moscow,ru&APPID=f2a7ca3bd41dfa2efab0ad667aafe1df").responseJSON {
            response in
            if let json = response.value,
                let jsonDict = json as? NSDictionary{
                if let weather = WeatherDataClass(weatherData: jsonDict) {
                        print("city: \(weather.cityName), temp: \(weather.currentWeather), description: \(weather.weatherDescription)")
                        DispatchQueue.main.async {
                            complition(weather) }
                }
            }
            
        }
    }
    
}
//complition: @escaping (WeatherDataClass?) -> Void

class dataLoader2Alamofire {
    
    
    func loadData(complition: @escaping (NewWeatherDataClass?) -> Void) {
        AF.request("https://api.openweathermap.org/data/2.5/forecast?lat=55.7522&lon=37.6156&appid=14a0d2798906ce419001ba9975479d05").responseJSON {
        response in
        if let json = response.value,
            let jsonDict = json as? NSDictionary{
            if let weather = NewWeatherDataClass(weatherData: jsonDict) {
                DispatchQueue.main.async {
                    complition(weather)}
            }
            
            }
        
        }
    
    
        }}
