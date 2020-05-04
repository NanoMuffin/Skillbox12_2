//
//  DataClass.swift
//  Skillbox12_2
//
//  Created by Александр Сорока on 03.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import Foundation

class WeatherDataClass {


var cityName: String = ""
var currentWeather: String = ""
var weatherDescription: String = ""
    
    init? (weatherData: NSDictionary){
        
        
        guard let cityName = weatherData["name"] as? String,
        let weather = weatherData["weather"] as? NSArray,
        let currentWeather = weather[0] as? NSDictionary,
        let main = weatherData["main"] as? NSDictionary,
        let mainInformation = main.value(forKey: "temp") as? Double else { return }
        
        if mainInformation == mainInformation {
            let convertedTemp = mainInformation - 273.15
            let temp = Int(convertedTemp)
            self.currentWeather = "\(temp)"
        }
        
        self.cityName = cityName
        self.weatherDescription = currentWeather["description"] as! String
        
    }}


class NewWeatherDataClass {
    
    var currentWeather: [Double] = []
    var weatherDescription: [String] = []
    var dayTime: [String] = []
    
    init? (weatherData: NSDictionary){
        
        guard let city = weatherData["city"] as? NSDictionary,
            let list = weatherData["list"] as? NSArray else { return  }
        
        for (i,data) in list.enumerated() {
            let weather = list[i] as! NSDictionary
            let pogoda = weather["main"] as! NSDictionary
            let finalValue = pogoda["temp"] as! Double
            self.currentWeather.append(finalValue)
            
            let description = weather["weather"] as! NSArray
            
        for (i,data) in description.enumerated() {
                let data = description[i] as! NSDictionary
                let convertedData = data["description"] as! String
                self.weatherDescription.append(convertedData) }
            
            let dayTime = weather["dt_txt"] as! String
            self.dayTime.append(dayTime)
        
        }
        
        print(self.dayTime)
        
//
    
//
//        for (_,data) in firstData {
//            if firstData == firstData{
//                let weather = firstData["main"] as! NSDictionary
//                let pogoda = weather["temp"] as! Double
//                self.currentWeather.append(pogoda) }}

    }
}
