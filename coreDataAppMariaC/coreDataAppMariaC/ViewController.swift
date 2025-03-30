//
//  ViewController.swift
//  coreDataAppMariaC
//
//  Created by student on 3/16/25.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    var dataManager : NSManagedObjectContext!
    var listArray = [NSManagedObject]()

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        textField.text?.removeAll()
        fetchdata()
        // Do any additional setup after loading the view.
    }
    
    func fetchdata(){
        let fetchrequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        do {
            let result = try dataManager.fetch(fetchrequest)
            listArray = result as! [NSManagedObject]
            for item in listArray{
                let product = item.value(forKey: "about") as! String
                textDisplay.text! += product
            }
        } catch {
            print ("Oops. Something went wrong")
        }
    }
    
    @IBAction func displayButton(_ sender: UIButton) {
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Item", into: dataManager)
        newEntity.setValue(textField.text!, forKey: "about")
        do {
            try self.dataManager.save()
            listArray.append(newEntity)
        } catch {
            print ("Oops. Something went wrong")
        }
        textDisplay.text?.removeAll()
        textField.text?.removeAll()
        fetchdata()
    }
    
    @IBAction func deleteRecord(_ sender: UIButton) {
        let deleteItem = textField.text!
        for item in listArray{
            if item.value(forKey: "about") as! String == deleteItem{
                dataManager.delete(item)
            }
            do {
                try self.dataManager.save()
            } catch {
                print ("Oops. Something went wrong")
            }
        }
        textDisplay.text?.removeAll()
        textField.text?.removeAll()
        fetchdata()
        
    }
    
    
    
}

