//
//  String+Numbers.swift
//  FlexiCalc
//
//  Created by waheedCodes on 15/06/2022.
//
// *******************************************************************************************
//
// → What's This File?
//   It's an extension for Swift Strings. We added a computed property to produce the numeric
//   equivalent if it exists.
//
// *******************************************************************************************

import Foundation

extension String {

    var doubleValue: Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)?.doubleValue
    }
}
