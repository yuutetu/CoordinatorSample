//
//  ApplicationCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let loginCoordinator: LoginCoordinator
    let mainCoordinator: MainCoordinator
    
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
            mainCoordinator.start()
        } else {
            loginCoordinator.start()
        }
    }
}
