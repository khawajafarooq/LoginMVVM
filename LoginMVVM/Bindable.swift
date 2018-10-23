//
//  Bindable.swift
//  LoginMVVM
//
//  Created by GIB on 10/24/18.
//  Copyright © 2018 Xmen. All rights reserved.
//

import Foundation

final class Bindable<T> {
    
    typealias CompletionHandler = ((T) -> ())
    
    private var propertyChanged: CompletionHandler? = nil
    
    var value: T {
        didSet {
            guard let observer = propertyChanged else { return }
            observer(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func observe(_ completion: @escaping CompletionHandler) {
        propertyChanged = completion
    }
    
    deinit {
        propertyChanged = nil
    }
}
