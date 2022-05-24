//
//  ViewController.swift
//  FlexiCalc
//
//  Created by waheedCodes on 22/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lcdDisplay: UIView!
    @IBOutlet weak var displayLabel: UILabel!

    @IBOutlet weak var pinpadButton0: UIButton!
    @IBOutlet weak var pinpadButton1: UIButton!
    @IBOutlet weak var pinpadButton2: UIButton!
    @IBOutlet weak var pinpadButton3: UIButton!
    @IBOutlet weak var pinpadButton4: UIButton!
    @IBOutlet weak var pinpadButton5: UIButton!
    @IBOutlet weak var pinpadButton6: UIButton!
    @IBOutlet weak var pinpadButton7: UIButton!
    @IBOutlet weak var pinpadButton8: UIButton!
    @IBOutlet weak var pinpadButton9: UIButton!

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!

    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!

    @IBOutlet weak var decimalButton: UIButton!

    var currentTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor: "#000000",
            displayColor: "#ffffff",
            extraFunctionColor: "#a6a6a6",
            extraFunctionTitleColor: "#ffffff",
            operationColor: "#ff9f0a",
            operationTitleColor: "#ffffff",
            pinpadColor: "#333333",
            pinpadTitleColor: "#ffffff")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
    }

    private func decorateView() {
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = UIColor(hex: currentTheme.displayColor)

        decorateButtons()
    }

    private func decorateButtons() {
        decoratePinpadButton(pinpadButton0, true)
        decoratePinpadButton(pinpadButton1)
        decoratePinpadButton(pinpadButton2)
        decoratePinpadButton(pinpadButton3)
        decoratePinpadButton(pinpadButton4)
        decoratePinpadButton(pinpadButton5)
        decoratePinpadButton(pinpadButton6)
        decoratePinpadButton(pinpadButton7)
        decoratePinpadButton(pinpadButton8)
        decoratePinpadButton(pinpadButton9)

        decorateExtraFunctionButton(clearButton)
        decorateExtraFunctionButton(negateButton)
        decorateExtraFunctionButton(percentageButton)

        decorateOperationButton(divideButton)
        decorateOperationButton(multiplyButton)
        decorateOperationButton(addButton)
        decorateOperationButton(minusButton)
        decorateOperationButton(equalButton)

        decoratePinpadButton(decimalButton)
    }

    private func decorateButton(_ button: UIButton,
                                _ usingSlicedImage: Bool = false) {
        let image = usingSlicedImage ? UIImage(named: "CircleSliced") : UIImage(named: "Circle")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
    }

    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)

        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor),
                             for: .normal)
        setFontSize(of: button, to: 35)
    }

    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)

        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor),
                             for: .normal)
        setFontSize(of: button, to: 45)
    }

    private func decoratePinpadButton(_ button: UIButton,
                                      _ usingSilcedImage: Bool = false) { 
        decorateButton(button, usingSilcedImage )

        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor),
                             for: .normal)
        setFontSize(of: button, to: 30)
    }

    private func setFontSize(of button: UIButton, to size: CGFloat) {
        button.titleLabel?.font = UIFont.systemFont(ofSize: size)
    }
}
