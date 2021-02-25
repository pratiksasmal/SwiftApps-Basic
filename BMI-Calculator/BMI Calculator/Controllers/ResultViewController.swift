//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Pratik Sasmal on 23/02/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //this is 1
    var bmiValue: String? //setting as an optional string
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue //the value we see on screen
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
