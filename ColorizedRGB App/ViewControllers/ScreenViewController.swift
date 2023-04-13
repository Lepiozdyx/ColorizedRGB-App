//
//  ScreenViewController.swift
//  ColorizedRGB App
//
//  Created by Alex on 11.04.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setBackgroundColor(for color: UIColor)
}

final class ScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }

}

// MARK: - ScreenViewControllerDelegate
extension ScreenViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(for color: UIColor) {
        view.backgroundColor = color
    }
}
