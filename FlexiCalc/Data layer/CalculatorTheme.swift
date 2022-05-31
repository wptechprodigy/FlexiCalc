//
//  CalculatorTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 23/05/2022.
//

import Foundation

enum StatusBarStyle {
    case light
    case dark
}

struct CalculatorTheme {
    let backgroundColor: String
    let displayColor: String

    let extraFunctionColor: String
    let extraFunctionTitleColor: String

    let operationColor: String
    let operationTitleColor: String

    let pinpadColor: String
    let pinpadTitleColor: String

    let statusBarStyle: StatusBarStyle
}
