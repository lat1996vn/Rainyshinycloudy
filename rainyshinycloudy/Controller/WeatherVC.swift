//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by LTT on 7/24/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var imgWeatherType: UIImageView!
    @IBOutlet weak var lblWheatherType: UILabel!
    @IBOutlet weak var tbvWeather: UITableView!
    var curWeather = CurrentWheather()
    var foreCasts = ForeCasts()
    override func viewDidLoad() {
        super.viewDidLoad()
        curWeather.downloadWeatherDetails {
            self.foreCasts.downloadForeCastsData {
                //print(self.listForeCast.count)
                self.tbvWeather.reloadData()
                self.updateMainUI()	
            }
        }
        print("test: \(self.foreCasts.listForeCast.count)")
        tbvWeather.dataSource = self
        tbvWeather.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foreCasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            cell.configureCell(foreCast: foreCasts.listForeCast[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func updateMainUI() {
        lblDate.text = curWeather.date
        lblCurrentTemp.text = String(format: "%.1f℃", curWeather.currentTemp)
        lblLocation.text = curWeather.cityName
        lblWheatherType.text = curWeather.weatherType
        imgWeatherType.image = UIImage(named: curWeather.weatherType)
    }
    
}

