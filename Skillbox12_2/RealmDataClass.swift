//
//  RealmDataClass.swift
//  Skillbox12_2
//
//  Created by Александр Сорока on 04.05.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class RealmDataClass: Object {
    
    static let RealmData = RealmDataClass()
    
    @objc dynamic var currentWeather: String = ""
    @objc dynamic var weatherDescription: String =  ""
    @objc dynamic var cityName: String = ""
    
}
