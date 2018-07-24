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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvWeather.dataSource = self
        tbvWeather.delegate = self
        print(CURRENT_WEATHER_URL)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
}

