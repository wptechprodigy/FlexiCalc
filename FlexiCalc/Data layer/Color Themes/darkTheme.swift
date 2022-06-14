//
//  darkTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {

    var darkTheme: CalculatorTheme {
        return CalculatorTheme(
            id:                                     3,
            backgroundColor:                        "#000000",
            displayColor:                           "#ffffff",

            extraFunctionColor:                     "#a6a6a6",
            extraFunctionTitleColor:                "#ffffff",

            operationColor:                         "#ff9f0a",
            operationTitleColor:                    "#ffffff",
            operationSelectedColor:                 "#FFFFFF",
            operationTitleSelectedColor:            "#ff9f0a",
            

            pinpadColor:                            "#333333",
            pinpadTitleColor:                       "#ffffff",

            statusBarStyle:                         .light
        )
    }
}
