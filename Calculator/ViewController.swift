//
//  ViewController.swift
//  Calculator
//
//  Created by Ethan Thomas on 8/23/16.
//  Copyright © 2016 Ethan Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var userIsCurrentlyTyping = false
    
    var calculatorBrain = CalculatorBrain()
    
    var clearPressed = false
    
    var displayValue: Double {
        get {
            return Double(outputLabel.text!)!
        }
        set {
            outputLabel.text = String(newValue)
        }
    }
    
    @IBAction func digitPressed(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsCurrentlyTyping {
            let textCurrentlyInDisplay = outputLabel.text!
            outputLabel.text = textCurrentlyInDisplay + digit
        } else {
            outputLabel.text = digit
        }
        userIsCurrentlyTyping = true
    }
    
    @IBAction func operatorPressed(sender: UIButton) {
        if userIsCurrentlyTyping {
            calculatorBrain.setOperand(operand: displayValue)
            userIsCurrentlyTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            calculatorBrain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = calculatorBrain.result
    }
    
    
}

