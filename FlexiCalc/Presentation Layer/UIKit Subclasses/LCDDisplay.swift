//
//  LCDDisplay.swift
//  FlexiCalc
//
//  Created by waheedCodes on 15/06/2022.
//
// *******************************************************************************************
//
// → What's This File?
//   It's a subclass. This is our label to display input and the results of equations.
//
//   Architectural Layer: Presentation Layer
//
// *******************************************************************************************

import UIKit

class LCDDisplay: UIView {

    // MARK: - IBOutlets

    @IBOutlet weak var label: UILabel!

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    private func sharedInit() {
        addMenuGestureRecognizer()
    }

    // MARK: - Gesture Recognizer

    private func addMenuGestureRecognizer() {
        let longPressGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(longPressGestureEventFired(_:))
        )
        addGestureRecognizer(longPressGesture)
    }

    @objc private func longPressGestureEventFired(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
            case .began:
                showMenu(from: gesture)
            default:
                break
        }
    }

    private func showMenu(from gesture: UILongPressGestureRecognizer) {
        let menu = UIMenuController.shared
        guard menu.isMenuVisible == false else { return }

        // Show the menu
        print("Show menu...")
    }
}
