//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by LTT on 7/24/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LON = "&lon="
let APP_ID = "&appid="
let API_KEY = "a914eded539da410b06927b6aa3dc612"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LAT)21.0245\(LON)105.841171\(APP_ID)\(API_KEY)"
let FORECAST_URL = "https://api.openweathermap.org/data/2.5/forecast?id=1581130&cnt=10&appid=a914eded539da410b06927b6aa3dc612"
