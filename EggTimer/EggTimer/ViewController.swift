//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    let eggTimes = ["Soft": 3,"Medium": 4, "Hard": 7]
    var secRemaining = 60
    
        
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 1.0
        
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

}
