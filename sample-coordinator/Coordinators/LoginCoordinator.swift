//
//  LoginCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    let window: UIWindow
    let loginViewController: UIViewController
    
    init(window: UIWindow) {
        self.window = window
        self.loginViewController = ViewController.viewController(
            with: "Login View",
            buttonModels: [
                ViewController.ButtonModel(title: "Login", closure: {
                    LoginManager.shared.login()
                })
            ]
        )
    }
    
    func start() {
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
}
