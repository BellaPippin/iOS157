//
//  ViewController.swift
//  alertControllerTextFieldAppMariaC
//
//  Created by student on 3/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResult.numberOfLines = 0
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Guessing Password", message: "Enter Password", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "Enter password..."
            textField.isSecureTextEntry = true
        })
        
        let okAction = UIAlertAction(title: "Go", style: .default, handler: {action -> Void in
            let savedText = alert.textFields![0] as UITextField
            self.labelResult.text = savedText.text
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

