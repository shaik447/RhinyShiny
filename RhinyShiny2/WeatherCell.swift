//
//  WeatherCell.swift
//  RhinyShiny2
//
//  Created by shaik mulla syed on 5/31/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func UpdateUI(forecast:Forecast){
        dayLabel.text=forecast.date
        lowTemp.text=forecast.lowTemp
        highTemp.text=forecast.highTemp
        weatherType.text=forecast.weatherType
        weatherImg.image=UIImage(named:forecast.weatherType)
    }

    

}
