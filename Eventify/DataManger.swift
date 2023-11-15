//
//  DataManger.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import Foundation
import CoreData
import SwiftUI
import MapKit
class DataManger{
    static let shared = DataManger()
    lazy var persistentContainer: NSPersistentContainer = {
         let container = NSPersistentContainer(name: "EventifyData")
         container.loadPersistentStores { description, error in
             if let error = error {
                 fatalError("Unable to load persistent stores: \(error)")
             }else{
                 print("loaded")
             }
         }
         return container
     }()
    
    
    
    func addUser(username:String , email:String ,password:String ){
        if let entity = NSEntityDescription.entity(forEntityName: "User", in: persistentContainer.viewContext){
            let user = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext )
            
            user.setValue(username, forKey: "username")
            user.setValue(email, forKey: "email")
            user.setValue(password, forKey: "password")
            
            
            do{
                try persistentContainer.viewContext.save()
                print("user saved")
            }catch{
                print(error)
            }
            
            
        }
    }
    
    
//    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
//                print(paths[0])
    
//    func fetchUsers() -> [User?] {
//        let request: NSFetchRequest<User> = User.fetchRequest()
//        
//
//        do {
//            let users = try persistentContainer.viewContext.fetch(request)
//            
//            if let user = users {
//                print("Found user")
//                return user
//            } else {
//                print("User not found")
//                return nil // Return nil if user not found
//            }
//        } catch {
//            print("Error fetching user: \(error)")
//            return nil // Return nil in case of an error
//        }
//    }
    func fetchUser(username: String) -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", username)

        do {
            let users = try persistentContainer.viewContext.fetch(request)
            
            if let user = users.first {
                print("Found user")
                return user
            } else {
                print("User not found")
                return nil // Return nil if user not found
            }
        } catch {
            print("Error fetching user: \(error)")
            return nil // Return nil in case of an error
        }
    }
    
    
    func fetchEvents()-> [Event]{
        let request:NSFetchRequest<Event> = Event.fetchRequest()
        do {
            let events = try persistentContainer.viewContext.fetch(request)
            return events
        }catch{
            print(error)
            return []
        }
    }
    func addImage(imageUrl:String ,event:Event){
        if let entity =  NSEntityDescription.entity(forEntityName: "EventImage", in: persistentContainer.viewContext){
            let eImage = NSManagedObject(entity:entity , insertInto: persistentContainer.viewContext)
            eImage.setValue(imageUrl, forKey: "imageUrl")
            event.addToEventImages(eImage as! EventImage)
            do{
                try persistentContainer.viewContext.save()
                print("imageSaved")
            }catch {
                print(error)
            }
        }
    }
    
    func addEvent(title:String , details:String ,user:User ,images: [UIImage?] ,location:CLLocationCoordinate2D){
        if let entity =  NSEntityDescription.entity(forEntityName: "Event", in: persistentContainer.viewContext){
            let event = NSManagedObject(entity:entity , insertInto: persistentContainer.viewContext)
            event.setValue(title, forKey: "title")
            event.setValue(details, forKey: "details")
            event.setValue(location.latitude, forKey: "latitude")
            event.setValue(location.longitude, forKey: "longitude")
            user.addToEvents(event as! Event)
            let imagesUrls = ImageModel().saveImagesToFile(images)
            for url in imagesUrls {
                addImage(imageUrl: url, event: event as! Event)
//
            }
            do{
                try persistentContainer.viewContext.save()
                print("event added")
            }catch {
                print(error)
            }
        }
    }
    
    
    
    
    
}
