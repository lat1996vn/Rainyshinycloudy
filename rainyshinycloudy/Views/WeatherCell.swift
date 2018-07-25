//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by LTT on 7/25/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var imgWeatherType: UIImageView!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var lblTempMax: UILabel!
    @IBOutlet weak var lblTempMin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell (foreCast: ForeCast){
        imgWeatherType.image = UIImage(named: foreCast.weatherType)
        lblDay.text = foreCast.date
        lblWeatherType.text = foreCast.weatherType
        lblTempMax.text = String(format: "%.1f℃", foreCast.tempMax)
        lblTempMin.text = String(format: "%.1f℃", foreCast.tempMin)
    }
}
