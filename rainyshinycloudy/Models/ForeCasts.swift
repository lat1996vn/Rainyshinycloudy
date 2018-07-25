//
//  ForeCasts.swift
//  rainyshinycloudy
//
//  Created by LTT on 7/25/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import Foundation
import Alamofire

class ForeCasts {
    private var _listForeCast = [ForeCast]()
    var listForeCast: [ForeCast] {
        return _listForeCast
    }
    var count: Int = 0
    func downloadForeCastsData (completed: @escaping DownloadComplete){
        let foreCastURL = URL(string: FORECAST_URL)!
        Alamofire.request(foreCastURL).responseJSON { respone in
            let result = respone.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let foreCast = ForeCast(dictWeather: obj)
                        
                        self._listForeCast.append(foreCast)
                    }
                    self.count = list.count
                    //print("test: \(self.count)")
                }
            }
            completed()
        }
    //print("test: \(self.count)")
    }
}
