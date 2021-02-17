//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView! //connects to progressbar
    
    var timer = Timer()
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 3,"Medium": 4, "Hard": 7]
    //var totalTime = 60
    var totalTime = 0
    var secondsPassed = 0
        
    @IBOutlet weak var titleLabel: UILabel! //con to label
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0 //resetting the progress bar, sec and hardness
        secondsPassed = 0
        titleLabel.text = hardness //as after running it will show Done
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo: nil, repeats: true) //time controller
    }
        @objc func updateTimer(){
            if secondsPassed < totalTime{
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                //print(Float(secondsPassed) / Float(totalTime)                       )
            }
            else {
                timer.invalidate()
                titleLabel.text = "DONE!"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
            }
        }
        //print(eggTimes[hardness])

}
