// https://github.com/lahirurane/Swift-Calculator/blob/master/calc/Calculator.swift
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
let o1 = args[0]; // Sample Code Only! Update Required!
let no3oper = args[1]; // Sample Code Only! Update Required!
let o2 = args[2]; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();
//Test
//print(o1)
//print(o2)
// Calculate the result
let result = calculator.add(no1: Int(o1)!, no2: Int(o2)!);
print("result: ")
print(result)
