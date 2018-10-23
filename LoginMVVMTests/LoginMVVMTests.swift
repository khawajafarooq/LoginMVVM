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
        // Given Login View Model is initiated
        
        // When
        loginViewModel.viewLoaded()
        
        // Then
        XCTAssert(loginViewModel.loginState.value == .initial(false))
    }
    
    func testEmptyTextFieldsState() {
        // Given Login View Model is initiated
        
        // When
        loginViewModel.enableLogin(for: "", and: "")
        
        // Then
        XCTAssert(loginViewModel.loginState.value == .initial(false))
    }
    
    func testFilledTextFieldsState() {
        // Given Login View Model is initiated
        
        // When
        loginViewModel.enableLogin(for: "username", and: "password")
        
        // Then
        XCTAssert(loginViewModel.loginState.value == .informationFilled(true))
    }
    
    func testLoginPressedState() {
        // Given Login View Model is initiated
        
        // When
        loginViewModel.loginPressed()
        
        // Then
        XCTAssert(loginViewModel.loginState.value == .loginPressed(false))
    }
}
