//
//  MenuView.swift
//  Eventify
//
//  Created by asmaa gamal  on 12/11/2023.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @AppStorage("loggedIn") var loggedIn: Bool?
    @AppStorage("username") var user: String?
    
    @Binding var selectedView: Int

    var body: some View {
        ZStack {
            Color.gray // Set the background color for the entire ZStack
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 5) {
                Button("Profile") {
                    selectedView = 1 // Set selected view to ProfileView
                }
                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                
                Button("Home") {
                    selectedView = 0 // Set selected view to HomeView
                }
                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                Button {
                    loggedIn = false
                    userManager.logout(viewRouter: viewRouter)
                    user = ""
                } label: {
                    Label("logout", systemImage: "arrow.backward.circle")
                        .foregroundColor(.red)
                }.padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
            }
            .padding(.top)
          
        }
    }
}
