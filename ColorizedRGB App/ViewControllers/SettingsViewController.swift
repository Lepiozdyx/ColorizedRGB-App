//
//  ViewController.swift
//  ColorizedRGB App
//
//  Created by Alex on 23.03.2023.
//

import UIKit

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
        delegate.setBackgroundColor(for: getValuesFromSliders())
        dismiss(animated: true)
    }
    
    // MARK: - Private functions
    private func changeLabelValues(for slider: UISlider, label: UILabel) {
        label.text = String(format: "%.2f", slider.value)
    }
    
    private func setupSlidersValues() {
        let ciColor = CIColor(color: color)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
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
