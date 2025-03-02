//
//  ViewController.swift
//  alertControllerAppMariaC
//
//  Created by student on 3/2/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Prince of Nigeria says:", message: "Send me the money!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "No.", style: .default, handler: { action -> Void in
            
        })
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

