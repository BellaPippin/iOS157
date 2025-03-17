//
//  ViewController.swift
//  myPListAppMariaC
//
//  Created by student on 3/13/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    @IBOutlet weak var mySlider: UISlider!
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        
        statusLabel.text = " "
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
        UserDefaults.standard.set(mySlider.value, forKey: "Slider")
        UserDefaults.standard.set(myTextField.text, forKey: "Text")
        
        statusLabel.text = "Saved!"
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        myTextField.text = UserDefaults.standard.string(forKey: "Text")
        
        statusLabel.text = "Loaded!"
    }
    
    @IBAction func restoreButton(_ sender: UIButton) {
        mySwitch.isOn = false
        mySlider.value = 5.0
        myTextField.text = " "
        myTextField.placeholder = "MariaC"
        
        statusLabel.text = "Restored!"
    }
    
}

