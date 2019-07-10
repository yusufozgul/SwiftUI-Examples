//
//  Calculator.swift
//  Calculator-SwiftUI
//
//  Created by Yusuf Özgül on 9.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import Foundation


class Calculator
{
    
    var firstValue: String = ""
    var secondValue: String = ""
    var operand: String? = nil
    var isNegative = false
    
    func getDigit(_ value: String) -> String
    {
        if operand == nil
        {
            firstValue += value
            return firstValue
        }
        else
        {
            secondValue += value
            return secondValue
        }
    }
    
    func negativePositive() -> String
    {
        if operand == nil
        {
            if isNegative
            {
                firstValue.remove(at: firstValue.startIndex)
                isNegative = false
                return firstValue
            }
            firstValue = "-\(firstValue)"
            isNegative = true
            return firstValue
        }
        else
        {
            if isNegative
            {
                secondValue.remove(at: secondValue.startIndex)
                isNegative = false
                return secondValue
            }
            secondValue = "-\(secondValue)"
            isNegative = true
            return secondValue
        }
    }
    
    func getOperand(_ operand: String) -> String
    {
        if self.operand == nil && operand != "%"
        {
            self.operand = operand
            isNegative = false
            return "0"
        }
        else if operand == "%"
        {
            self.operand = operand
            return calculate()
        }
        else
        {
            _ = calculate()
            self.operand = operand
            return firstValue
        }
    }
    
    func deleteLast() -> String
    {
        if operand == nil
        {
            firstValue = String(firstValue.dropLast())
            return firstValue
        }
        else
        {
            secondValue = String(secondValue.dropLast())
            return secondValue
        }
    }

    func calculate() -> String
    {
        if secondValue == "" && operand != "%"
        { return firstValue }
        
        if operand == "+"
        {
            firstValue = String(Double(firstValue)! + Double(secondValue)!)
        }
        else if operand == "-"
        {
            firstValue = String(Double(firstValue)! - Double(secondValue)!)
        }
        else if operand == "x"
        {
            firstValue = String(Double(firstValue)! * Double(secondValue)!)
        }
        else if operand == "÷"
        {
            firstValue = String(Double(firstValue)! / Double(secondValue)!)
        }
        else if operand == "%"
        {
            firstValue = String(Double(firstValue)! / 100)
        }
        secondValue = ""
        operand = nil
        
        if firstValue.first == "-"
        { isNegative = true }
        else { isNegative = false }
        
        if firstValue.last == "0"
        {
            firstValue = String(firstValue.dropLast().dropLast())
        }
        return firstValue
    }
    func reset() -> String
    {
        firstValue = ""
        secondValue = ""
        operand = nil
        isNegative = false
        return "0"
    }
}
