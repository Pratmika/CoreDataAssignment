//
//  CollegeViewController.swift
//  CollegeStudentData
//
//  Created by Pratmika Shridhar Nayak on 04/09/17.
//  Copyright © 2017 Pratmika Shridhar Nayak. All rights reserved.
//

import UIKit
import CoreData

class CollegeViewController: UIViewController {
    
    var collegeArray: [College] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<College>(entityName: "College")
        
        do {
            let collegeObjects = try context.fetch(request)
            collegeArray = collegeObjects
        } catch {
            print("Something went wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension CollegeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(collegeArray[indexPath.row].id)
        cell.detailTextLabel?.text = collegeArray[indexPath.row].collegeName

        return cell
    }
}




