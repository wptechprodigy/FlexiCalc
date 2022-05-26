//
//  MathEquation.swift
//  FlexiCalc
//
//  Created by waheedCodes on 24/05/2022.
//

import Foundation

struct MathEquation {

    // MARK: - OperationType

    enum OperationType {
        case add
        case minus
        case multiply
        case divide
    }

    // MARK: - Properties: examining a specie of math say 4 + 4 = 8

    var leftHandValue: Decimal
    var rightHandValue: Decimal?
    var operation: OperationType?
    var result: Decimal?

    // MARK: - Execution

    var isExecuted: Bool {
        return result != nil
    }
    
    mutating func execute() {

        guard
            let rightHandValue = self.rightHandValue,
            let operation = self.operation else {
                return
            }

        switch operation {
            case .add:
                result = leftHandValue + rightHandValue
            case .minus:
                result = leftHandValue - rightHandValue
            case .multiply:
                result = leftHandValue * rightHandValue
            case .divide:
                result = leftHandValue / rightHandValue
        }
    }

    // MARK: - Negate

    mutating func negateLeftHandValue() {
        leftHandValue.negate()
    }

    mutating func negateRightHandValue() {
        rightHandValue?.negate()
    }

    // MARK: - Percentage

    mutating func applyPercentageToLeftHandValue() {
        leftHandValue = calculatePercentageValue(leftHandValue)
    }

    mutating func applyPercentageToRightHandValue() {
        guard let decimalValue = rightHandValue else { return }
        rightHandValue = calculatePercentageValue(decimalValue)
    }

    private func calculatePercentageValue(_ decimal: Decimal) -> Decimal {
            // Making decimal an optional will amount to below:
            // guard let decimal = decimal else { return .nan }
            // Going this route might not be so intelligent
            // since we are performing math, we shouldn't be in a
            // situation were we had to deal with `NAN`.
            return decimal / 100
        }

    // MARK: - String Representation

    func printOutEquation() -> String {
        // 5 + 7 = 12
        let operationSymbol = generateStringRepresentationOfOperation()

        return leftHandValue.formatted()
                    + " "
                    + operationSymbol
                    + " "
                    + (rightHandValue?.formatted() ?? "")
                    + " = "
                    + (result?.formatted() ?? "")
    }

    private func generateStringRepresentationOfOperation() -> String {
        switch operation {
            case .add: return "+"
            case .minus: return "-"
            case .multiply: return "*"
            case .divide: return "÷"
            case .none: return ""
        }
    }
}
