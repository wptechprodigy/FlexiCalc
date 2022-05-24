//
//  MathEquationTests.swift
//  MathEquationTests
//
//  Created by waheedCodes on 22/05/2022.
//

import XCTest
@testable import FlexiCalc

class MathEquationTests: XCTestCase {

    func test_addition() throws {
        var mathEquation = MathEquation(leftHandValue: .zero)
        mathEquation.leftHandValue = 4
        mathEquation.operation = .add
        mathEquation.rightHandValue = 4

        mathEquation.execute()
        let expectedResult = Decimal(8)

        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

    func test_subtraction() throws {
        var mathEquation = MathEquation(leftHandValue: .zero)
        mathEquation.leftHandValue = 4
        mathEquation.operation = .subtract
        mathEquation.rightHandValue = 4

        mathEquation.execute()
        let expectedResult = Decimal.zero

        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

    func test_multiplication() throws {
        var mathEquation = MathEquation(leftHandValue: .zero)
        mathEquation.leftHandValue = 4
        mathEquation.operation = .multiply
        mathEquation.rightHandValue = 4

        mathEquation.execute()
        let expectedResult = Decimal(16)

        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

    func test_division() throws {
        var mathEquation = MathEquation(leftHandValue: .zero)
        mathEquation.leftHandValue = 4
        mathEquation.operation = .divide
        mathEquation.rightHandValue = 4

        mathEquation.execute()
        let expectedResult = Decimal(1)

        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
}
