//
//  ViewController.swift
//  MixTheColors
//
//  Created by Oxyenniu on 11.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorValue: UILabel!
    @IBOutlet weak var greenColorValue: UILabel!
    @IBOutlet weak var blueColorValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        setColor()
        setValue(for: redColorValue, greenColorValue, blueColorValue)
        
    }
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redColorValue.text = string(from: redSlider)
        case greenSlider:
            greenColorValue.text = string(from: greenSlider)
        default:
            blueColorValue.text = string(from: blueSlider)
        }
        
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorValue:
                redColorValue.text = string(from: redSlider)
            case greenColorValue:
                greenColorValue.text = string(from: greenSlider)
            default:
                blueColorValue.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String{
        String(format: "%.2f", slider.value)
    }
    

}

