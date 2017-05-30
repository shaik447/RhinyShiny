//
//  CurrentWeather.swift
//  RhinyShiny
//
//  Created by shaik mulla syed on 5/26/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit
import Networking

class CurrentWeather{
    private var _cityname:String!
    private var _date:String!
    private var _weatherType:String!
    private var _currentTemp:Double!
    
    var cityname:String{
        if let abc = _cityname {
            return  abc
        }
        return ""
    }
    
    var weatherType:String{
        return _weatherType ?? ""
        
    }
    
    var currentWeather:Double{
        return _currentTemp ?? 0.0
    }
    
    var todaydate:String{
        let dateFormator=DateFormatter()
        dateFormator.dateStyle = .full
        dateFormator.timeStyle = .none
        _date="Today,\(dateFormator.string(from: Date()))"
        return _date
    }
    
    func downloadWeatherData(completed:@escaping DownloadComplete) {
//        var currentWeatherUrl=URL(string: CURRENT_WEATHER_URL)
        //let paramets:[String:String]=["lat" : "35", "lon" : "139", "appid" : "526d3a95d91c642ca394af566568a920" ]
        let networking=Networking(baseURL: CURRENT_WEATHER_URL)
        networking.get("get", completion: {result in
            switch result {
            case .success(let response):
                let tres=response.dictionaryBody
                for r in tres{
                    print(r)
                    if r.key=="main"{
                      
                        
                        if let main=r.value as? Dictionary<String,Any>{
                            
                            let humidity=main["humidity"] as! Int
                            print("humidity=\(humidity)")
                            print("source control added")
                        }
                        
                    }
                }
                
                
                completed()
            // Do something with JSON, you can also get arrayBody
            case .failure(let response):
                // Handle error
                print(response)
            }
        })
        
        
    
    
    }
}
