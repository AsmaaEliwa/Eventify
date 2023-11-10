//
//  EventImage+CoreDataProperties.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//
//

import Foundation
import CoreData


extension EventImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventImage> {
        return NSFetchRequest<EventImage>(entityName: "EventImage")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var event: Event?

}

extension EventImage : Identifiable {

}
