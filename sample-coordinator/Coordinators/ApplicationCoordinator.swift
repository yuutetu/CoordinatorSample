//
//  ApplicationCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    enum State {
        case login
        case main
    }

    let window: UIWindow
    let loginCoordinator: LoginCoordinator
    let mainCoordinator: MainCoordinator
    private var state: State?
    var currentCoordinator: Coordinator? {
        switch state {
        case .none:
            return nil
        case .some(.main):
            return mainCoordinator
        case .some(.login):
            return loginCoordinator
        }
    }
    
    init(window: UIWindow) {
        self.window = window
        loginCoordinator = LoginCoordinator(window: window)
        mainCoordinator = MainCoordinator(window: window)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "LoginManagerLoginStateChanged"), object: nil, queue: nil) { _ in
            self.updateUsingCoordinator()
        }
    }
    
    func start() {
        updateUsingCoordinator()
    }
    
    private func updateUsingCoordinator() {
        if LoginManager.shared.isLoggedIn {
            state = .main
            mainCoordinator.start()
        } else {
            state = .login
            loginCoordinator.start()
        }
    }
}
