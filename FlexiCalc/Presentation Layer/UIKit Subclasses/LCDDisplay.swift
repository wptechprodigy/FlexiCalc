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
        layer.cornerRadius = 20
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
        registerNotifications()
        highlightScreen()
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

    private func hideMenu() {
        UIMenuController.shared.hideMenu(from: self)
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
        guard let numberToPaste = UIPasteboard.general.string?.doubleValue else { return }

        let pasteNumberNotification = Notification.Name("com.waheedcodes.FlexiCalc.LCDDisplay.pasteNumber")
        let userInfo: [AnyHashable: Any] = ["PasteKey": numberToPaste]
        NotificationCenter.default.post(
            name: pasteNumberNotification, object: nil, userInfo: userInfo)
    }

    // MARK: - Color Theme

    func prepareForColorThemeUpdate() {
        unhighlightScreen(animated: false)
        hideMenu()
    }

    // MARK: - Animations

    private func highlightScreen() {
        let theme = ThemeManager.shared.currentTheme

        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.backgroundColor = UIColor(hex: theme.operationColor)
            self?.label.textColor = UIColor(hex: theme.operationTitleColor)
        } completion: { _ in

        }
    }

    private func unhighlightScreen(animated: Bool) {
        let theme = ThemeManager.shared.currentTheme

        let duration = animated ? 0.15 : 0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.backgroundColor = UIColor.clear
            self?.label.textColor = UIColor(hex: theme.displayColor)
        } completion: { _ in

        }
    }

    // MARK: - Notifications

    private func registerNotifications() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(willHideEditMenu(_:)),
                name: UIMenuController.willHideMenuNotification,
                object: nil)
    }

    private func unregisterNotifications() {
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIMenuController.willHideMenuNotification,
                object: nil)
    }

    @objc private func willHideEditMenu(_ notification: Notification) {
        unhighlightScreen(animated: true)
        unregisterNotifications()
    }
}
