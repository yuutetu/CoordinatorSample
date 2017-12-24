//
//  NavigationCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class NavigationCoordinator: Coordinator, TransitionDelegate {
    let text: String
    let navigationController: UINavigationController
    let rootViewController: UIViewController
    
    init(text: String) {
        self.text = text
        self.navigationController = UINavigationController()
        let rootViewController: TransitionViewController = TransitionViewController.viewController(with: text)
        self.rootViewController = rootViewController
        rootViewController.delegate = self
    }
    
    func start() {
        navigationController.viewControllers = [rootViewController]
    }
    
    // MARK: - TransitionDelegate
    
    func push() {
        let viewController = TransitionViewController.viewController(with: text)
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func startFlow() {
        let coordinator = FlowCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
