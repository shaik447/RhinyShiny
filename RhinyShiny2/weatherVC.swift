//
//  ViewController.swift
//  RhinyShiny
//
//  Created by shaik mulla syed on 8/29/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import UIKit
import Networking

class weatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTmpImg: UIImageView!
    @IBOutlet weak var currentTmpDesc: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let currentweather=CurrentWeather()
    var forecasts=[Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
//        currentweather.downloadWeatherData {name , age in
//            print("\(name) \(age)")
//            return name
//        }
        
        currentweather.downloadWeatherData{
            print("completed")
            self.updateMainUI()
        }
        downloadForecastData {
            print("forecst completed")
        }
       
    }
    
    func downloadForecastData(Completed: @escaping DownloadComplete) {
        let networking = Networking(baseURL: FORECAST_URL)
        networking.get("get", completion: {result in
            switch result{
            case .success(let response):
                let dict=response.dictionaryBody
                if let wlists=dict["list"] as? [Dictionary<String,Any>]{
                    for wlist in wlists{
                        let forecast=Forecast(todayForecast: wlist)
                        print(forecast.date)
                        print(forecast.highTemp)
                        print(forecast.lowTemp)
                        print(forecast.weatherType)
                        self.forecasts.append(forecast)
                    }
                    
                }
            case .failure(let response):
                print(response.error)
            }
        })
    }

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
        
    }
    
    func updateMainUI(){
        dateLabel.text=currentweather.todaydate
        locationLabel.text=currentweather.cityname
        currentTempLabel.text="\(Int(currentweather.currentWeather))°C"
        currentTmpDesc.text=currentweather.weatherType
        currentTmpImg.image=UIImage(named: currentweather.weatherType)
        
    }
    
    


}

