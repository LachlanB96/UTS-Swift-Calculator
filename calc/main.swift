//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input
//let input1 = Int(args[0])!; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
//let input2 = Int(args[2])!; // Sample Code Only! Update Required!

let testArgs1 = ["5", "+", "3", "+", "2", "+", "8", "+", "5", "x", "20", "+", "2", "-", "5", "+", "1", "/", "1"]
let testArgs2 = ["+44"]
let testArgs3 = ["99999999999"]

// Initialize a Calculator object
let calculator = Calculator(expression: args);

// Calculate the result
let result = calculator.calculate();

print(result)
