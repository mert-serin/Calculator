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
    
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
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
        operandStack.append(Double(displayValue))
        middleOfTyping = false
        print(operandStack)
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
    


}

