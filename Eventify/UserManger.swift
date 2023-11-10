//
//  UserManger.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import Foundation
class UserManager: ObservableObject {
    @Published var user: User?
    
    func login(loggedUser: User) {
        user = loggedUser
    }

    func logout() {
        user = nil
    }

}
