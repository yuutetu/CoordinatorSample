//
//  ClosureButton.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import UIKit

class ClosureButton: UIButton {
    var tappedClosure: ((UIButton) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initCommon()
    }
    
    private func initCommon() {
        addTarget(self, action: #selector(handleTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func handleTapped(sender: UIButton) {
        tappedClosure?(sender)
    }
}
