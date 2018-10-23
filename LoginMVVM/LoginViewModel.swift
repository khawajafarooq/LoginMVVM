//
//  LoginViewModel.swift
//  LoginMVVM
//
//  Created by GIB on 10/24/18.
//  Copyright © 2018 Xmen. All rights reserved.
//

import Foundation

struct LoginState {
    var buttonIsEnabled: Bool
}

enum MyLoginState {
    case intial
    case informationFilled
    case loginPressed
}

class ViewModel {
    
    private(set) var loginState: MyLoginState = .intial {
        didSet {
            stateCheck()
        }
    }
    
    private(set) var state: LoginState = LoginState(buttonIsEnabled: false) {
        didSet {
            callback(state)
        }
    }
    
    typealias CallbackHandler = ((LoginState) -> Void)
    
    var callback: CallbackHandler
    
    init(callback: @escaping CallbackHandler) {
        self.callback = callback
        self.callback(state)
    }
    
    
    func loginPressed() {
        loginState = .loginPressed
    }
    
    func enableLoginIfRequired(usernameText: String?, passwordText: String?) {
        if let username = usernameText,
            !username.isEmpty,
            let password = passwordText,
            !password.isEmpty {
            loginState = .informationFilled
        } else {
            loginState = .intial
        }
    }
    
    private func stateCheck() {
        switch loginState {
        case .intial:
            state.buttonIsEnabled = false
            break
        case .informationFilled:
            state.buttonIsEnabled = true
            break
        case .loginPressed:
            state.buttonIsEnabled = false
            break
        }
    }
}
