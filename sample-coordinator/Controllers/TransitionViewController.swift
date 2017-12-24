//
//  TransitionViewController.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

protocol TransitionDelegate: class {
    func push()
    func pop()
    func popToRoot()
    func startFlow()
}

class TransitionViewController: UIViewController {
    struct ButtonModel {
        let title: String
        let closure: (() -> Void)?
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    private var text: String!
    weak var delegate: TransitionDelegate?
    
    static func viewController(with text: String) -> TransitionViewController {
        let viewController = UIStoryboard(name: "TransitionViewController", bundle: nil).instantiateInitialViewController() as! TransitionViewController
        viewController.text = text
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = text
    }
    
    @IBAction func push() {
        delegate?.push()
    }
    
    @IBAction func pop() {
        delegate?.pop()
    }
    
    @IBAction func popToRoot() {
        delegate?.popToRoot()
    }
    
    @IBAction func startFlow() {
        delegate?.startFlow()
    }
}
