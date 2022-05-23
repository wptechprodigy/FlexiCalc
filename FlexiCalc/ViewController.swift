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

    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
    }

    private func decorateView() {

        let backgroundColor: UIColor = .black
        let displayColor: UIColor = .white

        view.backgroundColor = backgroundColor
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = displayColor  

        decorateButtons()
    }

    private func decorateButtons() {
        decoratePinpadButton(pinpadButton0)
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

    private func decorateButton(_ button: UIButton) {
        button.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
        button.tintColor = .orange
        button.backgroundColor = .clear
    }

    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)

        let extraFunctionColor: UIColor = .lightGray
        let extraFunctionTitleColor: UIColor = .white

        button.tintColor = extraFunctionColor
        button.setTitleColor(extraFunctionTitleColor, for: .normal)
    }

    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)

        let operationColor: UIColor = .orange
        let operationTitleColor: UIColor = .white

        button.tintColor = operationColor
        button.setTitleColor(operationTitleColor, for: .normal)
    }

    private func decoratePinpadButton(_ button: UIButton) {
        decorateButton(button)

        let pinpadColor: UIColor = .darkGray
        let pinpadTitleColor: UIColor = .white

        button.tintColor = pinpadColor
        button.setTitleColor(pinpadTitleColor, for: .normal)
    }
}
