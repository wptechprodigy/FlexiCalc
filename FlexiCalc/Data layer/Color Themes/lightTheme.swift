//
//  lightTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension FlexiCalcViewController {

    var lightTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#F6F8F9",
            displayColor:                   "#000000",

            extraFunctionColor:             "#E9F0F4",
            extraFunctionTitleColor:        "#4BE6A9",

            operationColor:                 "#4BE6A9",
            operationTitleColor:            "#14145C",

            pinpadColor:                    "#E9F0F4",
            pinpadTitleColor:               "#000000",

            statusBarStyle:                 .dark
        )
    }
}
