//
//  darkBlueTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {

    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#1D1D1D",
            displayColor:                   "#727272",

            extraFunctionColor:             "#323232",
            extraFunctionTitleColor:        "#FFFFFF",

            operationColor:                 "#4566B6",
            operationTitleColor:            "#FFFFFF",

            pinpadColor:                    "#1D1D1D",
            pinpadTitleColor:               "#767676",

            statusBarStyle:                 .light
        )
    }
}
