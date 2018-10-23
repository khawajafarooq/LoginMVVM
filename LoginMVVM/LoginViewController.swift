//
//  ViewController.swift
//  LoginMVVM
//
//  Created by GIB on 10/24/18.
//  Copyright © 2018 Xmen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK:- outlets
    @IBOutlet fileprivate weak var usernameTextField: UITextField!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var loginButton: UIButton!
    
    fileprivate let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinding()
        viewModel.viewLoaded()
    }
    
    fileprivate func setupBinding() {
        
        viewModel.loginState.observe { [unowned self] state in
            switch state {
            case .initial (let enable): self.loginButton.isEnabled = enable
            case .informationFilled (let enable): self.loginButton.isEnabled = enable
            case .loginPressed (let enable):
                self.loginButton.isEnabled = enable
                self.usernameTextField.text = ""
                self.passwordTextField.text = ""
            }
        }
    }
    
    // MARK:- Button Handlers
    @IBAction func loginPressed(_ sender: Any) {
        viewModel.loginPressed()
    }

    // MARK:- text field delegate
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        viewModel.enableLogin(for: usernameTextField.text, and: passwordTextField.text)
    }

}

