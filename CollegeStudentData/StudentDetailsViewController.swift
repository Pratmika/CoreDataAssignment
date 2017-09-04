//
//  StudentDetailsViewController.swift
//  CollegeStudentData
//
//  Created by Pratmika Shridhar Nayak on 04/09/17.
//  Copyright © 2017 Pratmika Shridhar Nayak. All rights reserved.
//

import UIKit
import CoreData

class StudentDetailsViewController: UIViewController {
    var arrayOfStudents: [Student] = []

    var myCollege = ""
    
    @IBOutlet weak var studentNameField: UITextField!
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    
    @IBAction func saveStudent(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        
        context.perform {
            let studentEntity: Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
            
            //fetch student details
            if let studentId = self.studentIDField.text {
                studentEntity.id = Int32(studentId)!
            } else {
                studentEntity.id = 0
            }
            
            studentEntity.studentName = self.studentNameField.text
            
            //fetch college details
            let predicate = NSPredicate(format: "collegeName CONTAINS[cd] %@",self.myCollege)
            let request = NSFetchRequest<College>(entityName: "College")
            request.predicate = predicate
            
            
            
            
            do {
                let collegeObject = try context.fetch(request)
                //retrieve the first search match
                let myColl = collegeObject.first!
                print(myColl.id)
                print(myColl.collegeName)
                
                myColl.addToContains(studentEntity)   
            } catch {
                print("Unable to fetch")
            }
            
            do {
                try context.save()
            } catch {
                print("Could not save student details")
            }
            
            
//                print(studentEntity.id)
//                print(studentEntity.studentName)
//                print(studentEntity.goesTo?.id)
//                print(studentEntity.goesTo?.collegeName)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


