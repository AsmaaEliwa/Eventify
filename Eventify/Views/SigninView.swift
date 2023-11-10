//
//  SigninView.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI

struct SigninView: View {
    @State var username = ""
    @State var password = ""
    @State var showValidationAlert = false
    @AppStorage("loggedIn") var loggedIn = false
    @AppStorage("username") var user = ""
    @EnvironmentObject var userManager: User
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
                    if   loguser.password == password {
                        loggedIn = true
                        user = loguser.username ?? ""
                        userManager = loguser
                    }
                }
            }label: {
                Label("signin",systemImage: "rectangle.portrait.and.arrow.forward").padding(.top).foregroundColor(Color("node")).font(.system(size: 30))
            }
            
           Spacer()
        }.padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SigninView()
}
