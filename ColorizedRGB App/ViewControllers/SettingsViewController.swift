//
//  ViewController.swift
//  ColorizedRGB App
//
//  Created by Alex on 23.03.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setBackgroundColor(for color: UIColor)
}

final class SettingsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Public Properties
    var color: UIColor!
    unowned var delegate: SettingsViewControllerDelegate!

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = colorView.frame.height / 8
        setupSlidersValues()
        colorView.backgroundColor = getValuesFromSliders()
        changeLabelValues(for: redSlider, label: redLabel)
        changeLabelValues(for: greenSlider, label: greenLabel)
        changeLabelValues(for: blueSlider, label: blueLabel)
    }
    
    // MARK: - IB Actions
    @IBAction func slidersAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            changeLabelValues(for: redSlider, label: redLabel)
        case greenSlider:
            changeLabelValues(for: greenSlider, label: greenLabel)
        default:
            changeLabelValues(for: blueSlider, label: blueLabel)
        }
        colorView.backgroundColor = getValuesFromSliders()
    }
    
    @IBAction func doneButtonTapped() {
        let colorValue = getValuesFromSliders()
        delegate.setBackgroundColor(for: colorValue)
        dismiss(animated: true)
    }
    
    // MARK: - Private functions
    private func changeLabelValues(for slider: UISlider, label: UILabel) {
        label.text = String(format: "%.2f", slider.value)
    }
    
    private func setupSlidersValues() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func getValuesFromSliders() -> UIColor {
        return UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
