//
//  ViewController.swift
//  CollegeStudentData
//
//  Created by Pratmika Shridhar Nayak on 04/09/17.
//  Copyright © 2017 Pratmika Shridhar Nayak. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var arrayOfColleges: [College] = []
   
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func saveCollege(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.perform {
            let collegeEntity: College = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
            
            if let collegeId = self.idField.text {
                collegeEntity.id = Int32(collegeId)!
            } else {
                collegeEntity.id = 0
            }
            
            collegeEntity.collegeName = self.nameField.text
            
            do {
                try context.save()
            }
            catch let error {
                print(error)
            }
        }
    }
    
    @IBAction func addStudentToCollege(_ sender: Any) {
        let collegeName = nameField.text
        let StudentDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentDetailsViewController") as! StudentDetailsViewController
        StudentDetailsVC.myCollege = collegeName!
        present(StudentDetailsVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

