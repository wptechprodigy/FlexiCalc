//
//  UIButton+Animations.swift
//  FlexiCalc
//
//  Created by waheedCodes on 20/06/2022.
//

import Foundation
import UIKit

extension UIButton {

    func bounce() {
        moveUp()
    }

    private func growLarger() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 4, y: 4)
        } completion: { _ in

        }
    }

    private func makeSmaller() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        } completion: { _ in

        }
    }

    private func moveUp() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) { [weak self] in
            self?.transform = CGAffineTransform(translationX: 0, y: -50)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) { [weak self] in
                self?.transform = CGAffineTransform(translationX: 0, y: 5)
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) { [weak self] in
                    self?.transform = CGAffineTransform(translationX: 0, y: -2)
                } completion: { _ in
                    UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) { [weak self] in
                        self?.transform = CGAffineTransform(translationX: 0, y: 0)
                    } completion: { _ in

                    }
                }
            }
        }
    }
}
