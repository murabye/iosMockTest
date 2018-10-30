//
//  Person+CoreDataProperties.swift
//  TestExample4
//
//  Created by Владимир on 30/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var post: String?
    @NSManaged public var status: Bool
    @NSManaged public var wage: Int64
    @NSManaged public var exp: Bool
    @NSManaged public var startDate: NSDate?

}
