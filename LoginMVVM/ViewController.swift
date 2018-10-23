//
//  ViewController.swift
//  LoginMVVM
//
//  Created by GIB on 10/24/18.
//  Copyright © 2018 Xmen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK:- outlets
    @IBOutlet fileprivate weak var usernameTextField: UITextField!
    @IBOutlet fileprivate weak var passwordLabel: UITextField!
    @IBOutlet fileprivate weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK:- text field delegate
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        // keyboard up
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // keyboard down
    }

}

