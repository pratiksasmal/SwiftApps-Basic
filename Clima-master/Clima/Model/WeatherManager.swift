//
//  WeatherManager.swift
//  Clima
//
//  Created by Pratik Sasmal on 27/02/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c7fbadf8b783c8024d75059cc91f617e&units=metric"

    func fetch(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        //print(urlString)
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        //1 creating URl
        if let url = URL(string: urlString){
            //2 creating url session
            let session = URLSession(configuration: .default)
            
            //3 give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            //4 start the task
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
