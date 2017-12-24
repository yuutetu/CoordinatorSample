//
//  FlowCoordinator.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class FlowCoordinator: Coordinator {
    let navigationController: UINavigationController
    let firstViewController: ViewController
    let secondViewController: ViewController
    let thirdViewController: ViewController
    private var viewControllers: [UIViewController] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.firstViewController = ViewController.viewController(
            with: "First View",
            buttonModels: []
        )
        self.secondViewController = ViewController.viewController(
            with: "Second View",
            buttonModels: []
        )
        self.thirdViewController = ViewController.viewController(
            with: "Third View",
            buttonModels: []
        )
    }
    
    func start() {
        viewControllers = navigationController.viewControllers
        navigationController.pushViewController(firstViewController, animated: true)
        firstViewController.buttonModels = [
            ViewController.ButtonModel(title: "Next", closure: {
                self.displaySecond()
            })
        ]
        secondViewController.buttonModels = [
            ViewController.ButtonModel(title: "Next", closure: { [weak self] in
                self?.displayThird()
            })
        ]
        thirdViewController.buttonModels = [
            ViewController.ButtonModel(title: "Finish", closure: { [weak self] in
                self?.finish()
            })
        ]
    }
    
    private func displaySecond() {
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    private func displayThird() {
        navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    private func finish() {
        // かなり強引な感じがあるので、やっぱりフロー系はModalで出すべきか。
        navigationController.setViewControllers(viewControllers, animated: true)
    }
}
