//
//  EventifyApp.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI

@main
struct EventifyApp: App {
    let persistenceController = DataManger.shared.persistentContainer
//    @AppStorage("loggedIn") var loggedIn = false
    @StateObject var userManager = UserManager() // Create a single instance of UserManager

    var body: some Scene {
        WindowGroup {
            NavigationStack {
//                if  loggedIn == true  {
//                    
//                    HomeView()
//                        .environment(\.managedObjectContext, persistenceController.viewContext)
//                        .environmentObject(userManager) // Provide the single instance of UserManager
//                } else {
                    splashView()
                        .environment(\.managedObjectContext, persistenceController.viewContext)
                        .environmentObject(userManager) // Provide the single instance of UserManager
//                }
            }
        }
    }
}
