//
//  ViewController.swift
//  Skillbox12_2
//
//  Created by Александр Сорока on 03.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherDescriptionlabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: [Double] = []
    var weatherDescription: [String] = []
    var dayTime: [String] = []
    private let realm = try! Realm()
    lazy var allObjects = realm.objects(RealmDataClass.self)
    let realmObject = RealmDataClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let loader = dataLoaderAlamofire()
        loader.loadData { (weatherData) in
            if let weatherData = weatherData {
                DispatchQueue.main.async {
                    
                    try! self.realm.write {
                        
                        let newObj = RealmDataClass()
                        
                        newObj.cityName = weatherData.cityName
                        newObj.currentWeather = weatherData.currentWeather
                        newObj.weatherDescription = weatherData.weatherDescription
                        
                        self.realm.add(newObj)
                    }
                    
                    self.cityLabel.text = self.allObjects.last?.cityName ?? ""
                    
                    self.currentWeatherLabel.text = self.allObjects.last?.currentWeather ?? ""
                    
                    self.weatherDescriptionlabel.text = self.allObjects.last?.weatherDescription ?? ""
                }
            }
        }
        
    
        let newLoader = dataLoader2Alamofire()
        newLoader.loadData {
            (weatherData) in
            if let weatherData = weatherData {
                DispatchQueue.main.async {
                    self.currentWeather = weatherData.currentWeather
                    self.dayTime = weatherData.dayTime
                    self.weatherDescription = weatherData.weatherDescription
                    print(self.currentWeather)
                        self.tableView.reloadData() }
                    }
                    
                }
        
        print(allObjects)
    }
    
    
        
}
        




extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.dayLabel.text = self.dayTime[indexPath.row]
        cell.hour1Label.text = "\(Int(self.currentWeather[indexPath.row] - 273.15))"
        cell.hour1temp.text = self.weatherDescription[indexPath.row]
        
        if indexPath.row == indexPath.row + 1 && indexPath.row < 40 {
            cell.dayLabel.text = self.dayTime[indexPath.row + 1]
            cell.hour1Label.text = "\(self.currentWeather[indexPath.row + 1])"
            cell.hour1temp.text = self.weatherDescription[indexPath.row + 1]
        }
       
        
        
        return cell
    }
    
    
}
