//
//  bloodOrangeTheme.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

extension ThemeManager {
    
    var bloodOrangeTheme: CalculatorTheme {
        return CalculatorTheme(
            id:                             1,
            backgroundColor:                "#4A1D41",
            displayColor:                   "#ffffff",

            extraFunctionColor:             "#9C3766",
            extraFunctionTitleColor:        "#ffffff",

            operationColor:                 "#8D3362",
            operationTitleColor:            "#ffffff",

            pinpadColor:                    "#C64661",
            pinpadTitleColor:               "#ffffff",

            statusBarStyle:                 .light
        )
    }
}
