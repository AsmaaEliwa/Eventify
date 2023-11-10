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
    @AppStorage("loggedIn") var loggedIn = false
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if loggedIn {
                               HomeView()
                                    .environmentObject(UserManager())
                                   .environment(\.managedObjectContext, persistenceController.viewContext)
                } else {
                    NavigationView {
                        SigninView()
                            .environment(\.managedObjectContext, persistenceController.viewContext)
                    }
                }
            }
        }
    }
        
}
