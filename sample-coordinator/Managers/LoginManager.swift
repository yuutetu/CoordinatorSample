//
//  LoginManager.swift
//  sample-coordinator
//
//  Created by 加賀江 優幸 on 2017/12/24.
//  Copyright © 2017年 yuutetu. All rights reserved.
//

import Foundation

// 非常に簡素なLoginマネージャ
class LoginManager {
    static let shared: LoginManager = LoginManager()
    private(set) var isLoggedIn: Bool
    
    init() {
        isLoggedIn = false
    }
    
    func login() {
        isLoggedIn = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoginManagerLoginStateChanged"), object: nil)
    }
}
