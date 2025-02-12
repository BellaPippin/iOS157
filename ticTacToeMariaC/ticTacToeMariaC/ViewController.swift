//
//  ViewController.swift
//  ticTacToeMariaC
//
//  Created by student on 2/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    // Store the current player ("X" or "O")
    var currentPlayer: String = "X"

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.title(for: .normal) != nil {
                return  // Don't write on already pressed buttons
            }
        
        sender.setTitle(currentPlayer, for: .normal)
        
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
        
        currentPlayerLabel.text = "It's \(currentPlayer)'s turn"
        
        
    }
    
}


