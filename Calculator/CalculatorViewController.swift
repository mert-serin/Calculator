//
//  ViewController.swift
//  Calculator
//
//  Created by Mert Serin on 19/01/16.
//  Copyright © 2016 Mert Serin. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var middleOfTyping = false
    var isFloat = false
    var floatPart = ""
    
    
    
    @IBAction func appendDigit(sender: UIButton) {
        var digit = sender.currentTitle!
        if(sender.currentTitle == "π"){
            digit = "\(M_PI)"
        }
        if(isFloat){
            floatPart += digit
        }
        if(middleOfTyping){
            display.text! += digit
        }
        else if(!middleOfTyping && digit != "0"){
            display.text! = digit
            middleOfTyping = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if(middleOfTyping){
            enter()
        }
        switch operation{
        case "+": performOperation{$0 + $1}
        case "x": performOperation{$0 * $1}
        case "-": performOperation{$0 - $1}
        case "÷": performOperation{$1 / $0}
        case "√": performOperation{sqrt($0)}
        case "sin": performOperation{sin($0)}
        case "cos": performOperation{cos($0)}
        default:break
        }
        
    }
    
    func performOperation(operation: (Double, Double) -> Double){
        if(operandStack.count >= 2){
        displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
        enter()
        }
    }
    @nonobjc
    func performOperation(operation: Double -> Double){
        if(operandStack.count >= 1){
        displayValue = operation(operandStack.removeLast())
        enter()
        }
    }
    
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        if(isFloat){
            let count = Double(floatPart.characters.count)
            var floatNumber = operandStack.removeLast()
            floatNumber += Double(floatPart)! / pow(10.0,count)
        }
        else{
        operandStack.append(Double(displayValue))
        middleOfTyping = false
        print(operandStack)
        }
        isFloat = false
    }
    
    
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = "\(newValue)"
            middleOfTyping = false
        }
    }
    
    @IBAction func createFloatingNumber(sender: UIButton) {
        if(!isFloat){
        operandStack.append(Double(displayValue))
        isFloat = true
        if(display.text! != ""){
        display.text! += "."
        }
        }
    }
    
    


}

