//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Pratik Sasmal on 24/02/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmi: Float = 0.0
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        bmi = weight / (height * height)
    }
}
