//
//  electroTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {

    var electroTheme: CalculatorTheme {
        return CalculatorTheme(
            id:                                     4,
            backgroundColor:                        "#0E0E41",
            displayColor:                           "#ffffff",

            extraFunctionColor:                     "#14145C",
            extraFunctionTitleColor:                "#4BE6A9",

            operationColor:                         "#4BE6A9",
            operationTitleColor:                    "#14145C",
            operationSelectedColor:                 "#14145C",
            operationTitleSelectedColor:            "#4BE6A9",

            pinpadColor:                            "#14145C",
            pinpadTitleColor:                       "#ffffff",

            statusBarStyle:                         .light
        )
    }
}
