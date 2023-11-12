//
//  SigninView.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI
//import Foundation
import Combine
struct SigninView: View {
    @State var username = ""
    @State var password = ""
    @State var showValidationAlert = false
    @AppStorage("loggedIn") var loggedIn:Bool?
    @AppStorage("username") var user = ""
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var currentView: AnyView?
    @State var didSignin = false
    var body: some View {
        VStack{
            Spacer()
            input(lable: "Username", text: $username , placeholder: "Enter username")
            input(lable: "Password", text: $password , placeholder: "Enter password")
            Spacer()
            Button{
                if username.isEmpty || password.isEmpty {
                    showValidationAlert = true
                }else{
                    let loguser = DataManger.shared.fetchUser(username: username)
                    
                    if   loguser?.password == password {
                        loggedIn = true
                        userManager.isLoggedIn = true
                          userManager.login(loggedUser: loguser ?? User())
                        viewRouter.determineRootView(loggedIn: true)
                        user = loguser?.username ?? ""
                    }
                }
            }label: {
                Label("signin",systemImage: "rectangle.portrait.and.arrow.forward").padding(.top).foregroundColor(Color("node")).font(.system(size: 30))
            }
            
            Spacer()
        }.padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//            .background(NavigationLink("", destination: HomeView().environmentObject(userManager), isActive: $didSignin).hidden())
//            .onReceive(Just(loggedIn)) { loggedIn in
//                if loggedIn {
//                    currentView = AnyView(HomeView())
//                } else {
//                    currentView = AnyView(splashView())
//                }
//            }
//            .overlay(
//                Group {
//                    if let view = currentView {
//                        view
//                    }
//                })
    }
}

#Preview {
    SigninView()
}
