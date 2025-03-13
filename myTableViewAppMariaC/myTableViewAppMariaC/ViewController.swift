//
//  ViewController.swift
//  myTableViewAppMariaC
//
//  Created by student on 3/9/25.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var petTable: UITableView!
    
    var pets: [Pet] = [
    
            Pet(petName: "Kenny", petImage: "dog1.jpg"),
            Pet(petName: "Oreo", petImage: "dog2.jpg"),
            Pet(petName: "Fido", petImage: "dog3.jpg"),
            Pet(petName: "Alien", petImage: "dog4.jpg"),
            Pet(petName: "Kenny", petImage: "dog1.jpg"),
            Pet(petName: "Oreo", petImage: "dog2.jpg"),
            Pet(petName: "Fido", petImage: "dog3.jpg"),
            Pet(petName: "Alien", petImage: "dog4.jpg"),
            Pet(petName: "Kenny", petImage: "dog1.jpg"),
            Pet(petName: "Oreo", petImage: "dog2.jpg"),
            Pet(petName: "Fido", petImage: "dog3.jpg"),
            Pet(petName: "Alien", petImage: "dog4.jpg"),
            Pet(petName: "Kenny", petImage: "dog1.jpg"),
            Pet(petName: "Oreo", petImage: "dog2.jpg"),
            Pet(petName: "Fido", petImage: "dog3.jpg"),
            Pet(petName: "Alien", petImage: "dog4.jpg")
            
    ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        petTable.dataSource = self
        petTable.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100  // Adjust as needed
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellID")
        }
        
        let pet = pets[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: pet.petImage)
        cell?.textLabel?.text = pet.petName
        
        return cell!
        
    }
    
    class Pet {
        let petName : String
        let petImage : String
        
        init(petName: String, petImage: String) {
            self.petName = petName
            self.petImage = petImage
        }
    }
    
    

}

