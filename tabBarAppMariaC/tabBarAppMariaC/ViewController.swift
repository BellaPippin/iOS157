//
//  ViewController.swift
//  tabBarAppMariaC
//
//  Created by student on 3/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = .systemPink
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        // Do any additional setup after loading the view.
    }

    func ShowAlert(dateTime : String){
        
        let alert = UIAlertController(title: "Selected Date and Time", message: "\(dateTime)", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "Ok!", style: .default, handler: {action -> Void in
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func getCurrentDateTime(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from: myDatePicker.date)
        ShowAlert(dateTime: selectedDate)
    }
}

