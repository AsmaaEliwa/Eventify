//
//  ProfileView.swift
//  Eventify
//
//  Created by asmaa gamal  on 12/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showAddEvent = false
    @State var title = ""
    @State var details = ""
    var body: some View{
        VStack{
            Button{
                showAddEvent = true
            }label: {
                Label("Add Event",systemImage: "plus")
            }
            
                            if let username = userManager.user?.username {
                                Text("Hello, \(username)")
                                Text(userManager.user?.email ?? "").font(.system(size: 20 ,design: .default))
                            } else {
                                Text("Hello, Guest")
                            }

                            List {
                                ForEach(Array(userManager.user?.events as? Set<Event> ?? [] ), id: \.self) { event in
                                    Text(event.title ?? "")
                                }
                            }.navigationTitle("My Events")
                .sheet(isPresented: $showAddEvent, content: {
                    VStack{
                        Text("New Event!").foregroundColor(Color("node")).shadow(radius: 10).font(.system(size: 25))
                        input(lable: "Event title", text: $title, placeholder: "Enter Event Title")
                        input(lable: "Event Details", text: $title, placeholder: "Enter Event Details")
                        
                        
                        Button{
                            
                        }label: {
                            Label("Save",systemImage: "note").foregroundColor(Color("node")).padding()
                        }
                    }.padding()
                })
        }
    }
    
}

#Preview {
    ProfileView()
}
