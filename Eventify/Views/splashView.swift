//
//  splashView.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI

struct splashView: View {
    @EnvironmentObject var userManager: UserManager
    @AppStorage("loggedIn") var loggedIn:Bool?
    var body: some View {
        if loggedIn ?? false {
            HomeView()
        } else {
            
            
            VStack{
                HStack(spacing:350){
                    NavigationLink(destination: SigninView().environmentObject(userManager)){
                        Label( "Login", systemImage: "rectangle.portrait.and.arrow.right.fill").foregroundColor(Color("node")).font(.system(size: 30 ,weight: .bold))
                    }
                    
                    //            Spacer()
                    NavigationLink(destination: SignupView()){
                        Label( "Signup", systemImage: "person.crop.circle.badge.plus").foregroundColor(Color("node")).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.system(size: 30 ,weight: .bold))
                    }
                }.padding(.top)
                
            }.padding()
            Spacer()
            Label("Eventify",systemImage: "note.text.badge.plus").foregroundColor(Color("node")).font(.system(size: 100 ,weight: .bold)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding()
            Spacer()
        }
    }
}
#Preview {
    splashView()
}
