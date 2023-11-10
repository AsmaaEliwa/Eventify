//
//  DataManger.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import Foundation
import CoreData
class DataManger{
    static let shared = DataManger()
    lazy var persistentContainer: NSPersistentContainer = {
         let container = NSPersistentContainer(name: "Eventify")
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
    
    
    
    
    
    
    
    
    
}
