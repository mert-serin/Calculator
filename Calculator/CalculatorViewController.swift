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
    
    var middleOfTyping:Bool = false
    
    
    
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
    
    


}

