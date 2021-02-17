//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*let softTime = 300
    let medTime = 430
    let hardTime = 720*/
    var timer = Timer()
    
    let eggTimes = ["Soft": 3,"Medium": 4, "Hard": 7]
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var secRemaining = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        secRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo: nil, repeats: true)
    }
        @objc func updateTimer(){
            if secRemaining > 0{
                print ("\(secRemaining) seconds.")
                secRemaining -= 1
            }
            else {
                timer.invalidate()
                titleLabel.text = "DONE!"
            }
        }
        //print(eggTimes[hardness])
        /*switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(medTime)
        case "Hard":
            print(hardTime)
        default:
            print("error")*/
    

}
