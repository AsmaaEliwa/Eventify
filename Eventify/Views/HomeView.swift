//
//  HomeView.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI
import CoreData
struct HomeView: View {
    @AppStorage("loggedIn") var loggedIn: Bool?
    @AppStorage("username") var user: String?
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var isMenuPresented = false
    @State private var selectedView = 0

    var body: some View {
           NavigationView {
               VStack {
             
               }
               .navigationTitle("Home")
               .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                                       Menu {
                                           Button("Profile") {
                                               selectedView = 1
                                           }

                                           Button("Home") {
                                               selectedView = 0
                                           }

                                           Button("Logout") {
                                               loggedIn = false
                                               userManager.logout(viewRouter: viewRouter)
                                               user = ""
                                           }
                                       } label: {
                                           Label("Menu", systemImage: "ellipsis.circle")
                                       }
                                   }
                               }
               
            
               VStack {
                   if selectedView == 0 {
                       HomeContent().environmentObject(userManager)
                           .environmentObject(viewRouter)
                   } else if selectedView == 1 {
                       ProfileView( selectedImages: []).environmentObject(userManager)
                           .environmentObject(viewRouter)
                   }
               }
           }
       }
   }
  


struct HomeContent: View{
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var events: [Event] = []
    var body: some View{
        VStack{
                            Text("Hi")
            
                            if let username = userManager.user?.username {
                                Text("Hello, \(username)")
                            } else {
                                Text("Hello, Guest")
                            }

                            List {
                                ForEach(events, id: \.self) { event in
                                    Text(event.title ?? "")
                                }
                            }.navigationTitle("All Events")
                            .onAppear {
                                events = DataManger.shared.fetchEvents()
                            }
        }
    }
    
}





