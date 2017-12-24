//
//  ViewController.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct ButtonModel {
        let title: String
        let closure: (() -> Void)?
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonContainerStackView: UIStackView!
    private var text: String!
    var buttonModels: [ButtonModel] = []
    
    static func viewController(with text: String, buttonModels: [ButtonModel]) -> ViewController {
        let viewController = UIStoryboard(name: "ViewController", bundle: nil).instantiateInitialViewController() as! ViewController
        viewController.text = text
        viewController.buttonModels = buttonModels
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = text
        for buttonModel in buttonModels {
            let button = ClosureButton()
            button.setTitle(buttonModel.title, for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.tappedClosure = { _ in
                buttonModel.closure?()
            }
            buttonContainerStackView.addArrangedSubview(button)
        }
    }
}

