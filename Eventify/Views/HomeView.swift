//
//  HomeView.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("loggedIn") var loggedIn:Bool?
    @AppStorage("username") var user:String?
    @EnvironmentObject var userManager: UserManager
    var body: some View {
        VStack{
            
            Button{
                loggedIn = false
                userManager.logout()
                user = ""
            }label: {
                Label("logout",systemImage: "arrow.backward.circle").foregroundColor(.red)
            }
            
            if let username = userManager.user?.username {
                      Text("Hello, \(username)")
                  } else {
                      Text("Hello, Guest")
                  }    }
            
        }
      
}

//#Preview {
//    HomeView()
//}
