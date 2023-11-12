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
    @AppStorage("loggedIn") var loggedIn:Bool?
    @StateObject var userManager = UserManager() // Create a single instance of UserManager
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
            WindowGroup {
                rootView(for: viewRouter.currentRoot)
                           .environmentObject(viewRouter) // Make sure the ViewRouter is available
                           .environmentObject(userManager)
                           .onAppear {
                               viewRouter.determineRootView(loggedIn: loggedIn ?? true)
                           }
            }
        }

    @ViewBuilder
    func rootView(for root: RootView) -> some View {
        switch root {
            case .splash:
                splashView()
                    .environment(\.managedObjectContext, persistenceController.viewContext)
                    .environmentObject(viewRouter) // Pass the ViewRouter
            case .home:
                HomeView()
                    .environmentObject(userManager)
        }
    }
    }
