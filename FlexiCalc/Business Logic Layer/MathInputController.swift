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

    // MARK: - Math Equation

    private(set) var mathEquation = MathEquation(leftHandValue: .zero)

    // MARK: - LCDDisplay

    var lcdDisplayText = ""

    // MARK: - Initializer

    init() {
        lcdDisplayText = mathEquation.leftHandValue.formatted()
    }

    // MARK: - Extra Functions

    mutating func negatePressed() {
        switch operandSide {
            case .leftHandSide:
                mathEquation.negateLeftHandValue()
                lcdDisplayText = mathEquation.leftHandValue.formatted()
            case .rightHandSide:
                mathEquation.negateRightHandValue()
                lcdDisplayText = mathEquation.rightHandValue?.formatted() ?? "Error"
        }
    }

    mutating func percentagePressed() {
        switch operandSide {
            case .leftHandSide:
                mathEquation.applyPercentageToLeftHandValue()
                lcdDisplayText = mathEquation.leftHandValue.formatted()
            case .rightHandSide:
                mathEquation.applyPercentageToRightHandValue()
                lcdDisplayText = mathEquation.rightHandValue?.formatted() ?? "Error"
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
        lcdDisplayText = mathEquation.result?.formatted() ?? "Error"
    }

    // MARK: - Number Input

    mutating func decimalPressed() {

    }

    mutating func numberPressed(_ number: Int) {
        let decimalValue = Decimal(number)
        lcdDisplayText = decimalValue.formatted()

        switch operandSide {
            case .leftHandSide:
                mathEquation.leftHandValue = decimalValue
            case .rightHandSide:
                mathEquation.rightHandValue = decimalValue
        }
    }
}
