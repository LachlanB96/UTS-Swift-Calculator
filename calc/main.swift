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
let input1 = Int(args[0])!; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
let input2 = Int(args[2])!; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.add(no1: input1, no2: input2);

print(result)
