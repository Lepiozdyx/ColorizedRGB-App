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

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
    }
    
    // MARK: - IB Actions
    @IBAction func redSliderAction() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        changeColorView()
    }
    @IBAction func greenSliderAction() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        changeColorView()
    }
    @IBAction func blueSliderAction() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
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
}

