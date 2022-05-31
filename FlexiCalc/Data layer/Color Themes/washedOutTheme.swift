//
//  washedOutTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension FlexiCalcViewController {

    var washedOutTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#ECF5FF",
            displayColor:                   "#0D2A4B",

            extraFunctionColor:             "#A3CFF9",
            extraFunctionTitleColor:        "#5487BA",

            operationColor:                 "#A3CFF9",
            operationTitleColor:            "#5487BA",

            pinpadColor:                    "#1D1D1D",
            pinpadTitleColor:               "#ffffff",

            statusBarStyle:                 .dark
        )
    }
}
