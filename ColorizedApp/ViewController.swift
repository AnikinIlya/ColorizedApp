//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Anikin Ilya on 06.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var colorPreviewView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPreviewView.layer.cornerRadius = 25
    }
    
    //MARK: - IB Actions
    @IBAction func changeRedColorValue() {
        redValueLabel.text = String(format: "%.2f", redColorSlider.value)
        updatePreview()
    }
    @IBAction func changeGreenColorValue() {
        greenValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        updatePreview()
    }
    @IBAction func changeBlueColorValue() {
        blueValueLabel.text = String(format: "%.2f", blueColorSlider.value)
        updatePreview()
    }
    
    //MARK: - Private Methods
    private func updatePreview(){
        colorPreviewView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value),blue: CGFloat(blueColorSlider.value),alpha: 1)
    }

}

