//
//  LoginViewModel.swift
//  LoginMVVM
//
//  Created by GIB on 10/24/18.
//  Copyright © 2018 Xmen. All rights reserved.
//

import Foundation

enum LoginState {
    case initial(Bool)
    case informationFilled(Bool)
    case loginPressed(Bool)
}

class LoginViewModel {
    
    // MARK: - bindings
    private(set) var loginState = Bindable<LoginState>(value: .initial(false))
    
    // MARK: - public methods
    func loginPressed() {
        updateLoginState(.loginPressed(false))
    }
    
    func enableLogin(for usernameText: String?, and passwordText: String?) {
        if let username = usernameText,
            !username.isEmpty,
            let password = passwordText,
            !password.isEmpty {
            updateLoginState(.informationFilled(false))
        } else {
            updateLoginState(.initial(false))
        }
    }
    
    // MARK: - helper methods
    fileprivate func updateLoginState(_ state: LoginState) {
        loginState.value = state
    }
}
