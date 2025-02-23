//
//  ViewController.swift
//  carOptionsMariaC
//
//  Created by student on 2/15/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var speakersLabel: UILabel!
    
    @IBOutlet weak var selectColorLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderAwesomeness(_ sender: UISlider) {
        sliderLabel.text = "Awesomeness: \(String(sender.value))"
        
    }
    
    @IBAction func sunRoof(_ sender: UISwitch) {
        if sender.isOn {
            let sunRoof = true
        }
        
    }
    
    @IBAction func speakersStepper(_ sender: UIStepper) {
        speakersLabel.text = String(Int(sender.value))
    }
    
    @IBAction func selectcolor(_ sender: UIMenu) {
        selectColorLabel.setTitle(sender.title, for: .normal)
    }
    
    
}

