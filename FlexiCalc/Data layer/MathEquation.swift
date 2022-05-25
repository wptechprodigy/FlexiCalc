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
}
