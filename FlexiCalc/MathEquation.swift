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
        case subtract
        case multiply
        case divide
    }

    // MARK: - Properties: examining a specie of math 4 + 4 = 8

    var leftHandValue: Decimal
    var rightHandValue: Decimal?
    var operation: OperationType?
    var result: Decimal?

    // MARK: - Methods
    
    mutating func execute() {

        guard
            let rightHandValue = self.rightHandValue,
            let operation = self.operation else {
                return
            }

        switch operation {
            case .add:
                result = leftHandValue + rightHandValue
            case .subtract:
                result = leftHandValue - rightHandValue
            case .multiply:
                result = leftHandValue * rightHandValue
            case .divide:
                result = leftHandValue / rightHandValue
        }
    }
}
