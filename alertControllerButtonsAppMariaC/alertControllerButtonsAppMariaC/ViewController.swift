//
//  ViewController.swift
//  alertControllerButtonsAppMariaC
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
        let alert = UIAlertController(title: "Warning", message: "Zombies are loose!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            self.labelResult.text = "Ok"})
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {action -> Void in
            self.labelResult.text = "Cancel"})
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive, handler: {action -> Void in
            self.labelResult.text = "Destroy"})
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(destroyAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

