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

    // MARK: - UIMenuController

    private func showMenu(from gestureRecognizer: UILongPressGestureRecognizer) {

        becomeFirstResponder()

        let menu = UIMenuController.shared
        guard menu.isMenuVisible == false else { return }

        let locationOfTouch = gestureRecognizer.location(in: self)
        var rect = bounds
        rect.origin = locationOfTouch
        rect.origin.y = rect.origin.y - 20
        rect.size = CGSize(width: 1, height: 44)
        menu.showMenu(from: self, rect: rect)
    }

    override var canBecomeFirstResponder: Bool {
        true
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return
            action == #selector(UIResponderStandardEditActions.copy(_:)) ||
            action == #selector(UIResponderStandardEditActions.paste(_:))
    }

    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = label.text
    }

    override func paste(_ sender: Any?) {
        let stringFromPasteboard = UIPasteboard.general.string
        let doubleValueFromPasteboard = stringFromPasteboard?.doubleValue
        // TODO: - inform calculator system of number 👉🏽 doubleValueFromPasteboard
    }
}
