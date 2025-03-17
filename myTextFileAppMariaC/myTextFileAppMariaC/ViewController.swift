//
//  ViewController.swift
//  myTextFileAppMariaC
//
//  Created by student on 3/13/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var typeBioHere: UITextField!
    
    @IBOutlet weak var displayNameHere: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("myTextFile.txt")
        do {
        
            try typeBioHere.text?.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
            try saveButton.setTitle("Saved!", for: .normal)

            } catch {
                print ("Oops, something went wrong.")
            }
        
        
    }
    
    @IBAction func displayButton(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("myTextFile.txt")
        
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayNameHere.text = fileContent
                
            } catch {
                print ("Oops, something went wrong.")
            }
    }
}

