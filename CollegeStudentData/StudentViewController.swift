//
//  StudentViewController.swift
//  CollegeStudentData
//
//  Created by Pratmika Shridhar Nayak on 04/09/17.
//  Copyright © 2017 Pratmika Shridhar Nayak. All rights reserved.
//

import UIKit
import CoreData

class StudentViewController: UIViewController {
    
    var studentArray : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<Student>(entityName: "Student")
        
        do {

            let studentObjects = try context.fetch(request)
            studentArray = studentObjects

        } catch {
            print("Couldn't fetch student details")
        }
        
//        for student in studentArray {
//            print(student.id)
//            print(student.studentName)
//            print(student.goesTo?.id)
//            print(student.goesTo?.collegeName)
//        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension StudentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        cell.textLabel?.text = String(studentArray[indexPath.row].id)
        cell.detailTextLabel?.text = studentArray[indexPath.row].studentName
//        cell.detailTextLabel?.text = studentArray[indexPath.row].goesTo?.collegeName
//        cell.detailTextLabel?.text = String(describing: studentArray[indexPath.row].goesTo?.id)
        
        return cell
    }
}

//cell.detailTextLabel?.text = collegeArray[indexPath.row].collegeName
