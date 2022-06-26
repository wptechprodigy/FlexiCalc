//
//  UIButton+Animations.swift
//  FlexiCalc
//
//  Created by waheedCodes on 20/06/2022.
//
// *******************************************************************************************
//
// → What's This File?
//   It's an extension. Its adds more features to UIButton, such as animation.
//   Architectural Layer: Presentation Layer
//
//   💡 Tip 👉🏽 Animations provide personality. They emotionally connect the product to the
//   audience and give the app a certain feel. Adding animations is a great idea.
// *******************************************************************************************

import Foundation
import UIKit

extension UIButton {

    func bounce() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) { [weak self] in
                self?.transform = CGAffineTransform.identity
            } completion: { _ in

            }
        }
    }
}
