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
    
    
    func fetchUser(username:String)->User{
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate.init(format: "username == @%", username)
        
        do {
            let user = try  persistentContainer.viewContext.fetch(request)
            print("found user")
            return user[0]
        }catch{
            print(error)
            return User()
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}
