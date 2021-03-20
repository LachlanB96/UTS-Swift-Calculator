//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    var expression:[String];
    
    var validChars = ["+", "-", "/", "x", "%"]
    /// For multi-step calculation, it's helpful to persist existing result
    init(expression:[String]){
        self.expression = expression;
        //print(self.expression);
    }
    
    //var currentResult:[String];
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func sub(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func multi(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func divi(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    
    func mod(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }
    
    func operate(currentResult:[String], index:Int, newValue:String) -> [String]{
        var expression = currentResult;
        expression[index] = newValue;
        expression.remove(at: index+1);
        expression.remove(at: index-1);
        //print(expression);
        return expression;
    }
    
    func removePositiveOperand(expression:[String]) -> [String] {
        var tempExpression = expression;
        if(tempExpression.count == 1){
            if(tempExpression[0].hasPrefix("+")){
                tempExpression[0] = String(tempExpression[0].dropFirst())
                //return expression[0].dropFirst()
                return tempExpression;
            }
        }
        return expression;
    }

    func checkValidInput(expression:[String]){
        for operand in expression{
            if(validChars.contains(operand)){
                print(operand)
            }
            print(Int(operand))
            if Int(operand) != nil{
                print(operand)
            }
        }
    }
    
    func calculate() -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        
        var i = 0;
        var currentResult = expression;
        var operand:String;
        checkValidInput(expression: currentResult);
        currentResult = removePositiveOperand(expression: currentResult);
        var precedance1 = true;
        while precedance1 == true{
            if (i == currentResult.count){
                precedance1 = false;
                break;
            }
            operand = currentResult[i];
            //print(operand)
            if (i % 2 == 1 && i < expression.count-1){
                switch operand{
                case "%":
                    currentResult = operate(currentResult: currentResult, index: i, newValue: String(mod(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!)))
                    i = 0;
                case "x":
                    currentResult[i] = String(multi(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!));
                    currentResult.remove(at: i+1);
                    currentResult.remove(at: i-1);
                    i = 0;
                case "/":
                    currentResult[i] = String(divi(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!));
                    currentResult.remove(at: i+1);
                    currentResult.remove(at: i-1);
                    i = 0;
                default:
                    i += 0;
                }
            }
            i += 1;
        }
        i = 0;
        while currentResult.count > 1{
            
            operand = currentResult[i];
            //print(operand)
            if (i % 2 == 1 && i < expression.count-1){
                switch operand{
                case "%":
                    currentResult = operate(currentResult: currentResult, index: i, newValue: String(mod(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!)))
                    i = 0;
                case "x":
                    currentResult[i] = String(multi(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!));
                    currentResult.remove(at: i+1);
                    currentResult.remove(at: i-1);
                    i = 0;
                case "/":
                    currentResult[i] = String(divi(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!));
                    currentResult.remove(at: i+1);
                    currentResult.remove(at: i-1);
                    i = 0;
                case "+":
                    //print("No1: \(currentResult[i-1]). No2: \(currentResult[i+1]). Op: \(currentResult[i])")
                    currentResult = operate(currentResult: currentResult, index: i, newValue: String(add(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!)))
                    i = 0;
                case "-":
                    currentResult[i] = String(sub(no1: Int(currentResult[i-1])!, no2: Int(currentResult[i+1])!));
                    currentResult.remove(at: i+1);
                    currentResult.remove(at: i-1);
                    i = 0;
                default:
                    exit(0)
                }
            }
            i += 1;
        }
        //print(currentResult)
        return(currentResult[0])
    }
}
