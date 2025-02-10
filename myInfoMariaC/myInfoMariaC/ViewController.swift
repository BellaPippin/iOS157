//
//  ViewController.swift
//  myInfoMariaC
//
//  Created by student on 2/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userInfo: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showInfo(_ sender: UIButton) {
        userInfo.text = "Maria Cosenza, (312) 222-2222"
    }
    
}

