//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var decimalButton: UIButton!
    private var isFinishedTypingNumber: Bool = true
        private var isInteger: Bool{
            get{
                return floor(displayValue) == displayValue
            }
        }

    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calcualte(symbol: calcMethod){
                displayValue = result
            }
        }
        
        updateDecimalButton()
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        updateDecimalButton()
    }
    
    func updateDecimalButton(){
        if let backgroundColor = decimalButton.backgroundColor {
            if isInteger {
                decimalButton.isEnabled = true
                decimalButton.backgroundColor = backgroundColor.withAlphaComponent(1.0)
            } else {
                decimalButton.isEnabled = false
                decimalButton.backgroundColor = backgroundColor.withAlphaComponent(0.5)
            }
        }
    }
    
}

