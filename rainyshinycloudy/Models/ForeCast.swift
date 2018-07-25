//
//  ForeCast.swift
//  rainyshinycloudy
//
//  Created by LTT on 7/25/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import Foundation

class ForeCast {
    private var _date: String!
    private var _weatherType: String!
    private var _tempMax: Double!
    private var _tempMin: Double!
    
    var date: String {
        return _date
    }
    var weatherType: String {
        return _weatherType
    }
    var tempMax: Double {
        return _tempMax
    }
    var tempMin: Double {
        return _tempMin
    }
    init() {
        _date = ""
        _weatherType = ""
        _tempMax = 0.0
        _tempMin = 0.0
    }
    init(dictWeather: Dictionary<String, AnyObject>) {
        if let dt = dictWeather["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        if let main = dictWeather["main"] as? Dictionary<String, AnyObject> {
            if let temp_min = main["temp_min"] as? Double {
                // Kenvin to Celsius
                self._tempMin = temp_min - 272.15
            }
            if let temp_max = main["temp_max"] as? Double {
                // Kenvin to Celsius
                self._tempMax = temp_max - 272.15
            }
        }
        if let weather = dictWeather["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main.capitalized
            }
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
