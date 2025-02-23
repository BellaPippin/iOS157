//
//  resultViewController.swift
//  familyTreeMariaC
//
//  Created by student on 2/23/25.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var selectedNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResultMessage()
    }
    
    func updateResultMessage() {
        guard let number = selectedNumber else { return }
        
        switch number {
        case "1":
            resultLabel.text = "You chose 1: You will have good luck today!"
        case "2":
            resultLabel.text = "You chose 2: An exciting opportunity awaits you."
        case "3":
            resultLabel.text = "You chose 3: Remember to take breaks and relax."
        case "4":
            resultLabel.text = "You chose 4: A surprise is coming your way soon."
        default:
            resultLabel.text = "Invalid selection."
        }
    }
}

