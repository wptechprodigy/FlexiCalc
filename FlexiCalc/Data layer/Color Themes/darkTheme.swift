//
//  darkTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension FlexiCalcViewController {

    var darkTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#000000",
            displayColor:                   "#ffffff",

            extraFunctionColor:             "#a6a6a6",
            extraFunctionTitleColor:        "#ffffff",

            operationColor:                 "#ff9f0a",
            operationTitleColor:            "#ffffff",

            pinpadColor:                    "#333333",
            pinpadTitleColor:               "#ffffff",

            statusBarStyle:                 .light
        )
    }
}
