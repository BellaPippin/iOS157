//
//  detailViewController.swift
//  familyTreeMariaC
//
//  Created by student on 2/23/25.
//

import UIKit

class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var selectedColor: String?
    var numberOptions: [String] = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NumberCell")
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    
    func updateTitle(with number: String) {
        self.title = "Number \(number)"
    }


    // Implement UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath)
        cell.textLabel?.text = numberOptions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNumber = numberOptions[indexPath.row]
        
        updateTitle(with: selectedNumber)
                
        let resultViewController = storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! resultViewController
                
        resultViewController.selectedNumber = selectedNumber
                
        navigationController?.pushViewController(resultViewController, animated: true)
    }

}
