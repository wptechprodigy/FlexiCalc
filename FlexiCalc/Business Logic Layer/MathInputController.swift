//
//  MathInputController.swift
//  FlexiCalc
//
//  Created by waheedCodes on 25/05/2022.
//

import Foundation

struct MathInputController {

    // MARK: - Operand Side

    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }

    private var operandSide = OperandSide.leftHandSide

    // MARK: - Constants

    private let groupingSymbol = Locale.current.groupingSeparator ?? ","
    private let decimalSymbol = Locale.current.decimalSeparator ?? "."
    private let minusSymbol = "-"
    private let errorMessage = "Error"

    // MARK: - Math Equation

    private(set) var mathEquation = MathEquation(leftHandValue: .zero)
    private var isEnteringDecimal = false

    // MARK: - LCDDisplay

    var lcdDisplayText = ""

    // MARK: - Initializer

    init() {
        lcdDisplayText = formatLCDDisplay(mathEquation.leftHandValue)
    }

    // MARK: - Extra Functions

    mutating func negatePressed() {
        guard isCompleted == false else { return }

        switch operandSide {
            case .leftHandSide:
                mathEquation.negateLeftHandValue()
                displayNegateSymbolOnDisplay(mathEquation.leftHandValue)
            case .rightHandSide:
                mathEquation.negateRightHandValue()
                displayNegateSymbolOnDisplay(mathEquation.rightHandValue)
        }
    }

    private mutating func displayNegateSymbolOnDisplay(_ decimal: Decimal?) {
        guard let decimal = decimal else { return }

        let isNegativeValue = decimal < 0 ? true : false
        if isNegativeValue {
            lcdDisplayText.addPrefixIfNeeded(minusSymbol)
        } else {
            lcdDisplayText.removePrefixIfNeeded(minusSymbol)
        }
    }

    mutating func percentagePressed() {
        guard isCompleted == false else { return }
        
        switch operandSide {
            case .leftHandSide:
                mathEquation.applyPercentageToLeftHandValue()
                lcdDisplayText = formatLCDDisplay(mathEquation.leftHandValue)
            case .rightHandSide:
                mathEquation.applyPercentageToRightHandValue()
                lcdDisplayText = formatLCDDisplay(mathEquation.rightHandValue)
        }
    }

    // MARK: - Operations

    mutating func addPressed() {
        guard isCompleted == false else { return }

        mathEquation.operation = .add
        startEditingRightHandValue()
    }

    mutating func minusPressed() {
        guard isCompleted == false else { return }

        mathEquation.operation = .minus
        startEditingRightHandValue()
    }

    mutating func multiplyPressed() {
        guard isCompleted == false else { return }

        mathEquation.operation = .multiply
        startEditingRightHandValue()
    }

    mutating func dividePressed() {
        guard isCompleted == false else { return }

        mathEquation.operation = .divide
        startEditingRightHandValue()
    }

    mutating func execute() {
        guard isCompleted == false else { return }

        mathEquation.execute()
        lcdDisplayText = formatLCDDisplay(mathEquation.result)
    }

    // MARK: - Editing Right Hand Side

    private mutating func startEditingRightHandValue() {
        operandSide = .rightHandSide
        isEnteringDecimal = false
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
        isEnteringDecimal = true
        lcdDisplayText = appendDecimalPointIfNeeded(lcdDisplayText)
    }

    private func appendDecimalPointIfNeeded(_ string: String) -> String {
        if string.contains(decimalSymbol) {
            return string
        }

        return string.appending(decimalSymbol)
    }

    mutating func numberPressed(_ number: Int) {
        guard number >= -9, number <= 9 else { return }

        switch operandSide {
            case .leftHandSide:
                let tuple = appendNewNumber(number,
                                            toPreviousInput: mathEquation.leftHandValue)
                mathEquation.leftHandValue = tuple.newNumber
                lcdDisplayText = tuple.newLcdDisplayText
            case .rightHandSide:
                let tuple = appendNewNumber(number,
                                            toPreviousInput: mathEquation.rightHandValue ?? .zero)
                mathEquation.rightHandValue = tuple.newNumber
                lcdDisplayText = tuple.newLcdDisplayText
        }
    }

    private func appendNewNumber(
        _ number: Int,
        toPreviousInput previousNumber: Decimal
    ) -> (newNumber: Decimal, newLcdDisplayText: String) {
        guard isEnteringDecimal == false else {
            return appendNewDecimalNumber(number)
        }

        let stringInput = String(number)
        var newStringRepresentation = previousNumber.isZero ? "" : lcdDisplayText
        newStringRepresentation.append(stringInput)

        newStringRepresentation = newStringRepresentation.replacingOccurrences(of: groupingSymbol, with: "")

        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newStringRepresentation) else {
            return (.nan, errorMessage)
        }

        let newNumber = convertedNumber.decimalValue
        let newLcdDisplayText = formatLCDDisplay(newNumber)
        return (newNumber, newLcdDisplayText)
    }

    private func appendNewDecimalNumber(_ number: Int) -> (
        newNumber: Decimal,
        newLcdDisplayText: String) {
            let stringInput = String(number)
            let newLCDDisplayText = lcdDisplayText.appending(stringInput)

            let formatter = NumberFormatter()
            formatter.generatesDecimalNumbers = true
            formatter.numberStyle = .decimal
            guard let convertedNumber = formatter.number(from: newLCDDisplayText) else {
                return (.nan, errorMessage)
            }

            let newNumber = convertedNumber.decimalValue
            return (newNumber, newLCDDisplayText)
    }

    // MARK: - LCD Display Formatting

    private func formatLCDDisplay(_ decimal: Decimal?) -> String {
        guard
            let decimal = decimal,
            decimal.isNaN == false
        else {
            return errorMessage
        }

        return decimal.formatted()
    }

    // MARK: - Computed Properties

    var isCompleted: Bool {
        return mathEquation.isExecuted
    }

    // MARK: - Copy & Paste

    mutating func pasteIn(_ decimal: Decimal) {
        switch operandSide {
            case .leftHandSide:
                mathEquation.leftHandValue = decimal
            case .rightHandSide:
                mathEquation.rightHandValue = decimal
        }
        
        // update LCD Display text
        lcdDisplayText = formatLCDDisplay(decimal)
    }
}
