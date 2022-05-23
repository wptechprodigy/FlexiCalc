//
//  UIColor+HexValue.swift
//  FlexiCalc
//
//  Created by waheedCodes on 23/05/2022.
//

import UIKit

extension UIColor {

    // Sample color hexcode value: #FFFFFF
    public convenience init?(hex: String) {
        let redComponent, greenComponent, blueComponent: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    redComponent = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    greenComponent = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blueComponent = CGFloat((hexNumber & 0x0000ff) >> 0) / 255

                    self.init(
                        red: redComponent,
                        green: greenComponent,
                        blue: blueComponent,
                        alpha: 1)
                }
            }
        }

        return nil
    }
}
