//
//  StartScreenViewController.swift
//  ColorizedApp
//
//  Created by Anikin Ilya on 24.08.2022.
//

import UIKit

//MARK: - Protocols
protocol SettingsViewControllerDelegate {
    func setBackground(red: Float, green: Float, blue: Float)
}

final class StartScreenViewController: UIViewController {
    
    //MARK: - Private Properties
    private var colorBackground: (Float, Float, Float) = (255, 255, 255)
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.backgroundColor = colorBackground
        settingsVC.colorDelegate = self
    }
}

//MARK: - Extensions
extension StartScreenViewController: SettingsViewControllerDelegate {
    func setBackground(red: Float, green: Float, blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
        
        colorBackground = (red, green, blue)
    }
}
