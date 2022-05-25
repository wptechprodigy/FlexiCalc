//
//  CalculatorEngine.swift
//  FlexiCalc
//
//  Created by waheedCodes on 24/05/2022.
//

import Foundation

struct CalculatorEngine {

    // MARK: - Math Editing Input

    var inputController = MathInputController()

    // MARK: - Equation History

    private var historyLog: [MathEquation] = []

    // MARK: - LCDDisplay

    var lcdDisplayText: String {
        return inputController.lcdDisplayText
    }

    // MARK: - ExtraFunctions

     mutating func clearPressed() {
         inputController = MathInputController()
     }

    mutating func negatePressed() {
        inputController.negatePressed()
    }

    mutating func percentagePressed() {
        inputController.percentagePressed()
    }

    // MARK: - Operations

    mutating func addPressed() {
        inputController.addPressed()
    }

    mutating func minusPressed() {
        inputController.minusPressed()
    }

    mutating func multiplyPressed() {
       inputController.multiplyPressed()
    }

    mutating func dividePressed() {
        inputController.dividePressed()
    }

    mutating func equalsPressed() {
        inputController.execute()
        historyLog.append(inputController.mathEquation)
        printEquationToDebugConsole()
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
        inputController.decimalPressed()
    }
    
    mutating func numberPressed(_ number: Int) {
        inputController.numberPressed(number)
    }

    // MARK: - Debug Console

    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.mathEquation.printOutEquation())
    }

    // MARK: - History Log

    private mutating func clearHistory() {
        historyLog = []
    }
}
