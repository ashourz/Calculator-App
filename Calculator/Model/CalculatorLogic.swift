//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Zak Ashour on 7/8/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod:String)?
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    
    mutating func calcualte(symbol: String) -> Double?{
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                self.intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double{
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "+":
                return n1 + n2
            default:
                fatalError("Unknown button: \(String(describing: operation))")
            }
        }
        return n2
    }
}
