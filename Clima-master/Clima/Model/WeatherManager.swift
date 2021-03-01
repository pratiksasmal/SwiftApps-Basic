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
        self.performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        //1 creating URl
        if let url = URL(string: urlString){
            //2 creating url session
            let session = URLSession(configuration: .default)
            //3 gives the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4 start the task
            task.resume()
        }
        
    }
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //print(decodedData.weather[0].id)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.conditionName)
            print(weather.temperatureString)
        }
        catch {
            print(error)
        }
    }
    
}

