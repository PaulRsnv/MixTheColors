//
//  ViewController.swift
//  MixTheColors
//
//  Created by Oxyenniu on 11.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redTextLabel: UILabel!
    @IBOutlet weak var greenTextLabel: UILabel!
    @IBOutlet weak var blueTextLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var choosingSegmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        setColor()
        setValue(from: redValueLabel, greenValueLabel, blueValueLabel)
        
    }
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        let hideRedString = (sender.selectedSegmentIndex == 1)
        let hideGreenString = (sender.selectedSegmentIndex == 2)
        let hideBlueString = (sender.selectedSegmentIndex == 3)
        
        redTextLabel.isHidden = hideRedString
        redValueLabel.isHidden = hideRedString
        redSlider.isHidden = hideRedString

        greenTextLabel.isHidden = hideGreenString
        greenValueLabel.isHidden = hideGreenString
        greenSlider.isHidden = hideGreenString

        blueTextLabel.isHidden = hideBlueString
        blueValueLabel.isHidden = hideBlueString
        blueSlider.isHidden = hideBlueString
        }
    

    
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
    private func setValue(from labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.0f", slider.value)
    }

}

