//
//  MainTabBarCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    let window: UIWindow
    let tabBarViewController: UITabBarController
    let leftCoordinator: NavigationCoordinator
    let centerCoordinator: NavigationCoordinator
    let rightCoordinator: NavigationCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.tabBarViewController = UITabBarController()
        self.leftCoordinator = NavigationCoordinator(text: "Left View")
        leftCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Left", image: nil, selectedImage: nil)
        self.centerCoordinator = NavigationCoordinator(text: "Center View")
        centerCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Center", image: nil, selectedImage: nil)
        self.rightCoordinator = NavigationCoordinator(text: "Right View")
        rightCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Right", image: nil, selectedImage: nil)
        tabBarViewController.viewControllers = [
            leftCoordinator.navigationController,
            centerCoordinator.navigationController,
            rightCoordinator.navigationController
        ]
    }
    
    func start() {
        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
        leftCoordinator.start()
        centerCoordinator.start()
        rightCoordinator.start()
    }
}
