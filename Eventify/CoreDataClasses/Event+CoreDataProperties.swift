//
//  Event+CoreDataProperties.swift
//  Eventify
//
//  Created by asmaa gamal  on 15/11/2023.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var comments: NSSet?
    @NSManaged public var user: User?
    @NSManaged public var eventImages: NSSet?

}

// MARK: Generated accessors for comments
extension Event {

    @objc(addCommentsObject:)
    @NSManaged public func addToComments(_ value: Comment)

    @objc(removeCommentsObject:)
    @NSManaged public func removeFromComments(_ value: Comment)

    @objc(addComments:)
    @NSManaged public func addToComments(_ values: NSSet)

    @objc(removeComments:)
    @NSManaged public func removeFromComments(_ values: NSSet)

}

// MARK: Generated accessors for eventImages
extension Event {

    @objc(addEventImagesObject:)
    @NSManaged public func addToEventImages(_ value: EventImage)

    @objc(removeEventImagesObject:)
    @NSManaged public func removeFromEventImages(_ value: EventImage)

    @objc(addEventImages:)
    @NSManaged public func addToEventImages(_ values: NSSet)

    @objc(removeEventImages:)
    @NSManaged public func removeFromEventImages(_ values: NSSet)

}

extension Event : Identifiable {

}
