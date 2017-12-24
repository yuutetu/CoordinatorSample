//
//  MainCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    let window: UIWindow
    let homeViewController: UIViewController
    
    init(window: UIWindow) {
        self.window = window
        self.homeViewController = ViewController.viewController(
            with: "Home View",
            buttonModels: []
        )
    }
    
    func start() {
        window.rootViewController = homeViewController
        window.makeKeyAndVisible()
    }
}
