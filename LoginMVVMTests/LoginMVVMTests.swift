//
//  LoginMVVMTests.swift
//  LoginMVVMTests
//
//  Created by GIB on 10/24/18.
//  Copyright © 2018 Xmen. All rights reserved.
//

import XCTest
@testable import LoginMVVM

class LoginMVVMTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        loginViewModel = LoginViewModel()
    }
    
    override func tearDown() {
        loginViewModel = nil
        super.tearDown()
    }
    
    func testViewInitialState() {
        loginViewModel.viewLoaded()
        XCTAssert(loginViewModel.loginState.value == .initial(false))
    }
    
    func testEmptyTextFieldsState() {
        loginViewModel.enableLogin(for: "", and: "")
        XCTAssert(loginViewModel.loginState.value == .initial(false))
    }
    
    func testFilledTextFieldsState() {
        loginViewModel.enableLogin(for: "username", and: "password")
        XCTAssert(loginViewModel.loginState.value == .informationFilled(true))
    }
    
    func testLoginPressedState() {
        loginViewModel.loginPressed()
        XCTAssert(loginViewModel.loginState.value == .loginPressed(false))
    }
}
