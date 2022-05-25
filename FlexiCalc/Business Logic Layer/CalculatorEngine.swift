//
//  CalculatorEngine.swift
//  FlexiCalc
//
//  Created by waheedCodes on 24/05/2022.
//

import Foundation

struct CalculatorEngine {

    // MARK: - Operand Side

    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }

    // MARK: - Math Equation

    private var mathEquation = MathEquation(leftHandValue: .zero)
    private var operandSide = OperandSide.leftHandSide

    // MARK: - LCDDisplay

    var lcdDisplayText = ""

    // MARK: - ExtraFunctions

     mutating func clearPressed() {
         mathEquation = MathEquation(leftHandValue: .zero)
         lcdDisplayText = mathEquation.leftHandValue.formatted()
         operandSide = .leftHandSide
     }

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

    func percentagePressed() {}

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

    mutating func equalPressed() {
        mathEquation.execute()
        lcdDisplayText = mathEquation.result?.formatted() ?? "Error"
    }

    // MARK: - Number Input

    func decimalPressed() {

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
