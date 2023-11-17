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
//           NavigationView {
               VStack {
                   TabView{
                       HomeContent().environmentObject(userManager).tabItem {
                           Image( systemName:"house" )

                       }
                       ProfileView(selectedImages: []).environmentObject(userManager).tabItem {
                           Image(systemName: "person.crop.circle")
                       }
                       AllEventsOnMAP(events: []).tabItem {
                           Image(systemName: "note.text")
                       }
                   }
               }
//               .navigationTitle("Home")
//               .toolbar {
//                   ToolbarItem(placement: .navigationBarTrailing) {
//                                       Menu {
//                                           Button("Profile") {
//                                               selectedView = 1
//                                           }
//
//                                           Button("Home") {
//                                               selectedView = 0
//                                           }
//
//                                           Button("Logout") {
//                                               loggedIn = false
//                                               userManager.logout(viewRouter: viewRouter)
//                                               user = ""
//                                           }
//                                       } label: {
//                                           Label("Menu", systemImage: "ellipsis.circle")
//                                       }
//                                   }
//                               }
//               
//            
//               VStack {
//                   if selectedView == 0 {
//                       HomeContent().environmentObject(userManager)
//                           .environmentObject(viewRouter)
//                   } else if selectedView == 1 {
//                       ProfileView( selectedImages: []).environmentObject(userManager)
//                           .environmentObject(viewRouter)
//                   }
//               }
           }
//       }
   }
  


struct HomeContent: View{
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var events: [Event] = []
    @State var searchText = ""
    
    var filteredEvents: [Event] {
        if searchText.isEmpty {
            return events
        } else {
            return events.filter { $0.title?.lowercased().contains(searchText.lowercased()) ?? false }
        }
    }
    var body: some View{
        VStack{
            //                            Text("Hi")
            HStack{
            if let username = userManager.user?.username {
                Text("Hello, \(username)").padding()
            } else {
                Text("Hello, Guest")
            }
            
            TextField("Search events", text: $searchText)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
                .onChange(of: searchText) { _ in
                    events = DataManger.shared.fetchEvents()
                }
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing, 10)
            }.padding()

                       List {
                           ForEach(filteredEvents, id: \.self) { event in
                               EventDetailView(event: event).environmentObject(userManager)
                               Spacer()
                           }
                       }.navigationTitle("All Events")
                            .onAppear {
                                events = DataManger.shared.fetchEvents()
                                
                            }
        }
    }
    
}





