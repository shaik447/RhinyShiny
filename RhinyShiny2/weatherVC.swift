//
//  ViewController.swift
//  RhinyShiny
//
//  Created by shaik mulla syed on 8/29/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import UIKit

class weatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTmpImg: UIImageView!
    @IBOutlet weak var currentTmpDesc: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let currentweather=CurrentWeather()
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
        }
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
    
    


}

