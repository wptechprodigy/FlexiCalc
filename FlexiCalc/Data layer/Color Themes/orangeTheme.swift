//
//  orangeTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {

    var orangeTheme: CalculatorTheme {
        return CalculatorTheme(
            id:                                     7,
            backgroundColor:                        "#DC6969",
            displayColor:                           "#ffffff",

            extraFunctionColor:                     "#D05353",
            extraFunctionTitleColor:                "#ffffff",

            operationColor:                         "#CC4D4D",
            operationTitleColor:                    "#ffffff",
            operationSelectedColor:                 "#ffffff",
            operationTitleSelectedColor:            "#CC4D4D",

            pinpadColor:                            "#C94848",
            pinpadTitleColor:                       "#ffffff",

            statusBarStyle:                         .light
        )
    }
}
