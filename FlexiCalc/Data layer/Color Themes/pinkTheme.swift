//
//  pinkTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {

    var pinkTheme: CalculatorTheme {
        return CalculatorTheme(
            id:                                     8,
            backgroundColor:                        "#253C5B",
            displayColor:                           "#EBF0EF",

            extraFunctionColor:                     "#294666",
            extraFunctionTitleColor:                "#EBF0EF",

            operationColor:                         "#FA569C",
            operationTitleColor:                    "#EBF0EF",
            operationSelectedColor:                 "#EBF0EF",
            operationTitleSelectedColor:            "#FA569C",

            pinpadColor:                            "#16253A",
            pinpadTitleColor:                       "#EBF0EF",

            statusBarStyle:                         .light
        )
    }
}
