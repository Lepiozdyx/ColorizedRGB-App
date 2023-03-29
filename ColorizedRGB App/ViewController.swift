//
//  ViewController.swift
//  ColorizedRGB App
//
//  Created by Alex on 23.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
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
        changeColorView()
    }
    
    // MARK: - Private functions
    private func changeColorView () {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func changeLabelValues(for slider: UISlider, label: UILabel) {
        label.text = String(format: "%.2f", slider.value)
    }
}
