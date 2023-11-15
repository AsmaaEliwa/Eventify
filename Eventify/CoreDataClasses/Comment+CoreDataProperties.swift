//
//  Comment+CoreDataProperties.swift
//  Eventify
//
//  Created by asmaa gamal  on 15/11/2023.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var body: String?
    @NSManaged public var event: Event?
    @NSManaged public var user: User?

}

extension Comment : Identifiable {

}
