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
    private var currentCoordinator: NavigationCoordinator? {
        switch tabBarViewController.selectedIndex {
        case 0:
            return leftCoordinator
        case 1:
            return centerCoordinator
        case 2:
            return rightCoordinator
        default:
            return nil
        }
    }
    
    init(window: UIWindow) {
        self.window = window
        self.tabBarViewController = UITabBarController()
        
        let leftNavigationController = UINavigationController()
        leftNavigationController.tabBarItem = UITabBarItem(title: "Left", image: nil, selectedImage: nil)
        self.leftCoordinator = NavigationCoordinator(navigationController: leftNavigationController, text: "Left View")
        
        let centerNavigationController = UINavigationController()
        centerNavigationController.tabBarItem = UITabBarItem(title: "Center", image: nil, selectedImage: nil)
        self.centerCoordinator = NavigationCoordinator(navigationController: centerNavigationController, text: "Center View")
        
        let rightNavigationController = UINavigationController()
        rightNavigationController.tabBarItem = UITabBarItem(title: "Right", image: nil, selectedImage: nil)
        self.rightCoordinator = NavigationCoordinator(navigationController: rightNavigationController, text: "Right View")
        
        tabBarViewController.viewControllers = [
            leftNavigationController,
            centerNavigationController,
            rightNavigationController
        ]
    }
    
    func start() {
        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
        leftCoordinator.start()
        centerCoordinator.start()
        rightCoordinator.start()
    }
    
    func startFlow() {
        currentCoordinator?.startFlow()
    }
}
