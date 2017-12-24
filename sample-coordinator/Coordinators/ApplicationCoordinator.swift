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
    let mainCoordinator: MainTabBarCoordinator
    private var state: State?
    
    init(window: UIWindow) {
        self.window = window
        loginCoordinator = LoginCoordinator(window: window)
        mainCoordinator = MainTabBarCoordinator(window: window)
        
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

    // 下記のコードでFlowCoordinatorでの画面遷移を開始する。
    // (UIApplication.shared.delegate as? AppDelegate)?.applicationCoordinator?.startFlow()
    // 実際にはURLSchemeを引数に与えて遷移する実装をするといいかもしれない。
    func startFlow() {
        switch state {
        case .some(.main):
            mainCoordinator.startFlow()
        default:
            return // Main Interfaceのときのみ開ける
        }
    }
}
