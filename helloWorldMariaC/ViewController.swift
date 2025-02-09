//
//  ViewController.swift
//  helloWorldMariaC
//
//  Created by student on 2/9/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var textDisplay: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Methods
    
    @IBAction func changeButton(_ sender: Any) {
        labelResult.text = textDisplay.text?.uppercased()
    }


}

