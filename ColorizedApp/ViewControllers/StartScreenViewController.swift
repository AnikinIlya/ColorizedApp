//
//  StartScreenViewController.swift
//  ColorizedApp
//
//  Created by Anikin Ilya on 24.08.2022.
//

import UIKit

//MARK: - Protocols
protocol SettingsViewControllerDelegate {
    func setBackground(color: UIColor)
}

final class StartScreenViewController: UIViewController {
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.colorDelegate = self
        settingsVC.backgroundColor = view.backgroundColor
    }
}

//MARK: - Extensions
extension StartScreenViewController: SettingsViewControllerDelegate {
    func setBackground(color: UIColor) {
        view.backgroundColor = color
    }
}
