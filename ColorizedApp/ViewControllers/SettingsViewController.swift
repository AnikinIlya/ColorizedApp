//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Anikin Ilya on 06.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var colorPreviewView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    //MARK: - Public Properties
    var colorDelegate: SettingsViewControllerDelegate!
    var backgroundColor: UIColor!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPreviewView.layer.cornerRadius = 25
        
        colorPreviewView.backgroundColor = backgroundColor
        
        setValue(for: redColorSlider, greenColorSlider, blueColorSlider)
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        setColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender {
        case redColorSlider:
            setValue(for: redValueLabel)
            setValue(for: redTextField)
        case greenColorSlider:
            setValue(for: greenValueLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueValueLabel)
            setValue(for: blueTextField)
        }
        
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        
        colorDelegate?.setBackground(color: colorPreviewView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    //MARK: - Private Methods
    private func setColor(){
        colorPreviewView.backgroundColor = UIColor (
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: backgroundColor)
        colorSliders.forEach { slider in
            switch slider {
            case redColorSlider: redColorSlider.value = Float(ciColor.red)
            case greenColorSlider: greenColorSlider.value = Float(ciColor.green)
            default: blueColorSlider.value = Float(ciColor.blue)
            }
        }
    }

    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel: redValueLabel.text = string(from: redColorSlider)
            case greenValueLabel: greenValueLabel.text = string(from: greenColorSlider)
            default: blueValueLabel.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: redTextField.text = string(from: redColorSlider)
            case greenTextField: greenTextField.text = string(from: greenColorSlider)
            default: blueTextField.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        
        if let currentValue = Float(text), currentValue <= 1 {
            switch textField {
            case redTextField:
                redColorSlider.setValue(currentValue, animated: true)
                setValue(for: redValueLabel)
            case greenTextField:
                greenColorSlider.setValue(currentValue, animated: true)
                setValue(for: greenValueLabel)
            default:
                blueColorSlider.setValue(currentValue, animated: true)
                setValue(for: blueValueLabel)
            }
            
            setColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter value from 0.0 to 1.0")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
