//
//  ViewController.swift
//  Calculator
//
//  Created by Nursultan on 13.12.2023.
//

import UIKit

class ViewController: UIViewController {

    var numberOfScreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false

    @IBOutlet weak var result: UILabel!

    @IBAction func digits(_ sender: UIButton){
        if mathSign {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            if let currentText = result.text {
                result.text = currentText + String(sender.tag)
            }
        }

        if let text = result.text, let number = Double(text) {
            numberOfScreen = number
        }
    }

    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag >= 11 && sender.tag <= 14 {
            operation = sender.tag
            firstNum = numberOfScreen
            mathSign = true

            switch sender.tag {
            case 11:
                result.text = "/"
            case 12:
                result.text = "×"
            case 13:
                result.text = "-"
            case 14:
                result.text = "+"
            default:
                break
            }
        } else if sender.tag == 15 {
            if operation != 0 {
                var resultValue: Double = 0
                switch operation {
                case 11: // divided by
                    resultValue = firstNum / numberOfScreen
                case 12: // multiply
                    resultValue = firstNum * numberOfScreen
                case 13:
                    resultValue = firstNum - numberOfScreen
                case 14:
                    resultValue = firstNum + numberOfScreen
                default:
                    break
                }
                result.text = String(resultValue)
                numberOfScreen = resultValue
                operation = 0
            }
        } else if sender.tag == 16 {
            if let number = Double(result.text!) {
                let squared = number * number
                result.text = String(squared)
                numberOfScreen = squared
            }
        } else if sender.tag == 17 {
            if let number = Double(result.text!) {
                if number >= 0 {
                    let squareRoot = sqrt(number)
                    result.text = String(squareRoot)
                    numberOfScreen = squareRoot
                } else {
                    result.text = "Error"
                }
            }
        } else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberOfScreen = 0
            operation = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
