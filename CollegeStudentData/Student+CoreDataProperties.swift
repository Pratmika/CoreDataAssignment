//
//  Student+CoreDataProperties.swift
//  CollegeStudentData
//
//  Created by Pratmika Shridhar Nayak on 04/09/17.
//  Copyright © 2017 Pratmika Shridhar Nayak. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: Int32
    @NSManaged public var studentName: String?
    @NSManaged public var goesTo: College?

}
