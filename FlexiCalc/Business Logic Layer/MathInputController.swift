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

    let groupingSymbol = Locale.current.groupingSeparator ?? ","

    // MARK: - Math Equation

    private(set) var mathEquation = MathEquation(leftHandValue: .zero)

    // MARK: - LCDDisplay

    var lcdDisplayText = ""

    // MARK: - Initializer

    init() {
        lcdDisplayText = formatLCDDisplay(mathEquation.leftHandValue)
    }

    // MARK: - Extra Functions

    mutating func negatePressed() {
        switch operandSide {
            case .leftHandSide:
                mathEquation.negateLeftHandValue()
                lcdDisplayText = formatLCDDisplay(mathEquation.leftHandValue)
            case .rightHandSide:
                mathEquation.negateRightHandValue()
                lcdDisplayText = formatLCDDisplay(mathEquation.rightHandValue)
        }
    }

    mutating func percentagePressed() {
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
        mathEquation.operation = .add
        operandSide = .rightHandSide
    }

    mutating func minusPressed() {
        mathEquation.operation = .minus
        operandSide = .rightHandSide
    }

    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operandSide = .rightHandSide
    }

    mutating func dividePressed() {
        mathEquation.operation = .divide
        operandSide = .rightHandSide
    }

    mutating func execute() {
        mathEquation.execute()
        mathEquation.leftHandValue = mathEquation.result ?? .zero
        operandSide = .rightHandSide
        lcdDisplayText = formatLCDDisplay(mathEquation.result)
    }

    // MARK: - Number Input

    mutating func decimalPressed() {

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
        let stringInput = String(number)
        let emptyInput = ""
        var newStringRepresentation = previousNumber.isZero ? emptyInput : lcdDisplayText
        newStringRepresentation.append(stringInput)

        newStringRepresentation = newStringRepresentation.replacingOccurrences(of: groupingSymbol, with: "")

        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newStringRepresentation) else {
            return (.nan, "Error")
        }

        let newNumber = convertedNumber.decimalValue
        let newLcdDisplayText = formatLCDDisplay(newNumber)
        return (newNumber, newLcdDisplayText)
    }

    // MARK: - LCD Display Formatting

    private func formatLCDDisplay(_ decimal: Decimal?) -> String {
        guard let decimal = decimal else {
            return "Error"
        }

        return decimal.formatted()
    }
}
