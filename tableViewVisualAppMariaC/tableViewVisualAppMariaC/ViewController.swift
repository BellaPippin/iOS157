//
//  ViewController.swift
//  tableViewVisualAppMariaC
//
//  Created by student on 3/6/25.
//

import UIKit 

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let petArray = ["cat", "dog", "parakeet", "parrot", "canary", "finch", "tropical fish", "goldfish", "sea horses","hamster", "gerbil", "rabbit", "turtle", "snake", "lizard", "hermit crab"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.textLabel?.text = petArray[indexPath.row]
        
        return cell! }
}
        
