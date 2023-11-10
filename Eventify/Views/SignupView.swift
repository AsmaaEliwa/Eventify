//
//  SignupView.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI

struct SignupView: View {
        @State var username = ""
        @State var password = ""
        @State var email = ""
    @State var showValidationAlert = false
    @State var didSignup = false
    func reset(){
        email = ""
        password = ""
        username = ""
    }
        var body: some View {
            VStack{
                Spacer()
                input(lable: "Username", text: $username , placeholder: "Enter username")
                input(lable: "Email", text: $email , placeholder: "Enter email")
                input(lable: "Password", text: $password , placeholder: "Enter password")
                Spacer()
                Button{
                    if username.isEmpty || password.isEmpty || email.isEmpty {
                        showValidationAlert = true
                    }else{
                        DataManger.shared.addUser(username: username, email: email, password: password)
                        didSignup = true
                        reset()
                    }
                }label: {
                    Label("signup",systemImage: "person.fill.badge.plus").padding(.top).foregroundColor(Color("node")).font(.system(size: 30))
                }
                .background(NavigationLink("", destination: SigninView(), isActive: $didSignup).hidden())

               Spacer()
                
                    .alert(isPresented: $showValidationAlert) {
                            Alert(
                                title: Text("Validation Error"),
                                message: Text("Please fill out the requirments.")
                            )
                        }
            }.padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }

#Preview {
    SignupView()
}
