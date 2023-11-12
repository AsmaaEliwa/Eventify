//
//  ViewRouter.swift
//  Eventify
//
//  Created by asmaa gamal  on 12/11/2023.
//

import Foundation

enum RootView {
    case splash, home
}

class ViewRouter: ObservableObject {
    @Published var currentRoot: RootView = .splash

    func determineRootView(loggedIn: Bool) {
        currentRoot = loggedIn ? .home : .splash
    }
}
