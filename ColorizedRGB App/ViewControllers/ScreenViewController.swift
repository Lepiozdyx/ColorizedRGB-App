//
//  ScreenViewController.swift
//  ColorizedRGB App
//
//  Created by Alex on 11.04.2023.
//

import UIKit

final class ScreenViewController: UIViewController {
    
    var backgroundColor: UIColor = .systemBackground

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = backgroundColor
        settingsVC.delegate = self
    }

}

// MARK: - ScreenViewControllerDelegate
extension ScreenViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(for color: UIColor) {
        backgroundColor = color
        view.backgroundColor = backgroundColor
    }
}
