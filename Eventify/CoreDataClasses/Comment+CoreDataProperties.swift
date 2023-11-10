//
//  Comment+CoreDataProperties.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var body: String?
    @NSManaged public var user: User?
    @NSManaged public var event: Event?

}

extension Comment : Identifiable {

}
