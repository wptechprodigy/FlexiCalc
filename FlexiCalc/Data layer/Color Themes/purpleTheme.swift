//
//  purpleTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {

    var purpleTheme: CalculatorTheme {
        return CalculatorTheme(
            id:                                     9,
            backgroundColor:                        "#F4F5FA",
            displayColor:                           "#1D1D1D",

            extraFunctionColor:                     "#F4F5FA",
            extraFunctionTitleColor:                "#7550FE",

            operationColor:                         "#7550FE",
            operationTitleColor:                    "#ffffff",
            operationSelectedColor:                 "#ffffff",
            operationTitleSelectedColor:            "#7550FE",

            pinpadColor:                            "#1D1D1D",
            pinpadTitleColor:                       "#ffffff",

            statusBarStyle:                         .dark
        )
    }
}
