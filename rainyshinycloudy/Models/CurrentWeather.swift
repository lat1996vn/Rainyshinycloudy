//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by LTT on 7/24/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWheather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    var cityName: String {
        return _cityName
    }
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    var weatherType: String {
        return _weatherType
    }
    var currentTemp: Double {
        return _currentTemp
    }
    init() {
        _cityName = ""
        _date = ""
        _weatherType = ""
        _currentTemp = 0.0
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofira download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON{ response in
            let  result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let tempKevin = main["temp"] as? Double {
                        let tempCelsius = tempKevin - 272.15
                        self._currentTemp = tempCelsius
                    }
                }
            }
            completed()
        }
    }
}
