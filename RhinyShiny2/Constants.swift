//
//  Constants.swift
//  RhinyShiny
//
//  Created by shaik mulla syed on 5/26/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import Foundation




let BASE_URL="http://samples.openweathermap.org/data/2.5/weather?"
var LAT="35"
var LON="139"
let APPID="&appid=526d3a95d91c642ca394af566568a920"
//let CURRENT_WEATHER_URL="\(BASE_URL)\(LAT)\(LON)\(APPID)"

let CURRENT_WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?lat=\(LAT)&lon=\(LON)&APPID=526d3a95d91c642ca394af566568a920"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(LAT)&lon=\(LON)&cnt=10&APPID=526d3a95d91c642ca394af566568a920"

//typealias DownloadComplete = (String,Int) -> (String)
typealias DownloadComplete = () -> ()




