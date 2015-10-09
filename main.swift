//
//  main.swift
//  calculator
//
//  Created by Yuyang Fan on 10/8/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation

// Standard input reading
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}


// Converts given String to Double and returns result
func convertToDouble(incoming:String) -> Double {
    return (incoming as NSString).doubleValue
}

// Returns the factorial of a given number, returns 1 if given number is 0
func factorial(incoming:Double) -> Double {
    if (incoming == 0) {
        return 1
    } else {
        return incoming * factorial(incoming - 1)
    }
}



print("Enter an expression separated by returns:")
    
    let firstInput = input().componentsSeparatedByString(" ")
    
    let firstNumber = convertToDouble(firstInput[0])
    
    let operation = input()
    

    

// Runs simple operations
func simpleOp(firstNumber:Double, operation:String) -> Double {
    var res: Double = 0
    
    switch operation {
    case "+":
        let secondNumber = convertToDouble(input())
        res = firstNumber + secondNumber
        
    case "-":
        let secondNumber = convertToDouble(input())
        res = firstNumber - secondNumber
        
    case "*":
        let secondNumber = convertToDouble(input())
        res = firstNumber * secondNumber
        
    case "/":
        let secondNumber = convertToDouble(input())
        res = firstNumber / secondNumber
        
    case "%":
        let secondNumber = convertToDouble(input())
        res = firstNumber % secondNumber
    
    case "fact":
         return factorial(firstNumber)
        
    case "count":
        return Double(firstInput.count)
        
    case "avg":
        var total: Double = 0
        for var i = 0; i < firstInput.count; i++ {
            total += convertToDouble(firstInput[i])
        }
        return (total/Double(firstInput.count))
        
    default:
        res = 0
        
    }
    return res
    
}

// print stuff
print("Result: \(simpleOp(firstNumber, operation: operation))")


