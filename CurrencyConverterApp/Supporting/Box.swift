//
//  Box.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Foundation

// Data binding
class Box<T> {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
           listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
