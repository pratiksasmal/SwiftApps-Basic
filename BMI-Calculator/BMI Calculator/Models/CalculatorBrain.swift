//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Pratik Sasmal on 24/02/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        //using nil coalescing operator
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        //chaining BMI optional
        return bmiTo1DecimalPlace
    }
    func getAdvice() -> String {
        //using nil coalescing operator
        //let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        //chaining BMI optional
        return bmi?.advice ?? "No advice for you Sire"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            //print("underweight")
            bmi = BMI(value: bmiValue, advice: "Eat more", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue >= 18.5 && bmiValue <= 24.9 {
            print("normal")
            bmi = BMI(value: bmiValue, advice: "You are in shape", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }
        else {
            print("over")
            bmi = BMI(value: bmiValue, advice: "Eat less cookies", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
}
