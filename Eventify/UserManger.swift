//
//  UserManger.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//
import MapKit
import Foundation
import SwiftUI
class UserManager: ObservableObject {
    @AppStorage("username") var username:String?
    @Published var user: User?
    @Published var isLoggedIn: Bool {
           didSet {
               UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
           }
       }

       init() {
           self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
           user = DataManger.shared.fetchUser(username: username ?? "")
       }

    func login(loggedUser: User) {
        user = loggedUser
    }

    func logout(viewRouter: ViewRouter) {
           isLoggedIn = false
           // Perform any additional cleanup or tasks upon logout if needed
           viewRouter.determineRootView(loggedIn: false)
       }
    
    func addEvent(title: String, details: String, myUser: User, images: [UIImage?],location:CLLocationCoordinate2D){
        DataManger.shared.addEvent(title: title, details: details, user: myUser, images: images, location: location)
        user = DataManger.shared.fetchUser(username: username ?? "")
    }
}
