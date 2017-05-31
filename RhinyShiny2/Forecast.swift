//
//  Forecast.swift
//  RhinyShiny2
//
//  Created by shaik mulla syed on 9/5/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import UIKit
import Networking

class Forecast{
    private var _date:String!
    private var _weatherType:String!
    private var _highTemp:String!
    private var _lowTemp:String!
    
    
    init(todayForecast:Dictionary<String,Any>) {
        if let temp=todayForecast["temp"] as? Dictionary<String,Any>{
            let hightmp=temp["max"] as! Double
            let highTmpCelcius=round(hightmp - 273.15)
            self._highTemp="\(Int(highTmpCelcius))"
            
            
            let lowtmp=temp["min"] as! Double
            let lowtmpCelcius=round(lowtmp - 273.15)
            self._lowTemp="\(Int(lowtmpCelcius))"
        }
        
        if let temp=todayForecast["weather"] as? [Dictionary<String,Any>] {
            self._weatherType=temp[0]["main"] as! String
        }
        
        
        if let tempdate=todayForecast["dt"] as? Double {
            let dateFormator = DateFormatter()
            dateFormator.dateStyle = .full
            dateFormator.dateFormat = "EEEE"
            self._date = dateFormator.string(from: Date(timeIntervalSince1970: tempdate))
            //print(self._date)
        }
    }
    
    var date:String{
        return _date ?? ""
    }
    
    var weatherType:String{
        return _weatherType ?? ""
    }
    
    var highTemp:String{
        return _highTemp ?? ""
    }
    
    var lowTemp:String{
        return _lowTemp ?? ""
    }
    
    
}
