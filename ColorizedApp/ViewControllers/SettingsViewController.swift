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
    
    //MARK: - Public Properties
    var colorDelegate: SettingsViewControllerDelegate!
    var backgroundColor: (Float, Float, Float)!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPreviewView.layer.cornerRadius = 25
        
        redColorSlider.value = backgroundColor.0
        greenColorSlider.value = backgroundColor.1
        blueColorSlider.value = backgroundColor.2
        
        updatePreview()
    }
    
    //MARK: - IBActions
    @IBAction func changeRedColorValue() {
        updatePreview()
    }
    @IBAction func changeGreenColorValue() {
        updatePreview()
    }
    @IBAction func changeBlueColorValue() {
        updatePreview()
    }
    
    @IBAction func doneButtonPressed() {
        colorDelegate.setBackground(
            red: redColorSlider.value,
            green: greenColorSlider.value,
            blue: blueColorSlider.value
        )
        dismiss(animated: true)
    }
    
    //MARK: - Private Methods
    private func updatePreview(){
        colorPreviewView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
        
        redValueLabel.text = String(format: "%.2f", redColorSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueColorSlider.value)
    }

}

