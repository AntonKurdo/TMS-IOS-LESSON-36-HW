//
//  Bindable.swift
//  cntr
//
//  Created by Yury Vozleev on 15.04.2024.
//

import Foundation

@propertyWrapper
class Bindable<T> {
    var wrappedValue: T {
        get {
           value
        }
        
        set {
            handlers.forEach { $0(newValue) }
            value = newValue
        }
    }
    
    private var value: T
    private var handlers: [((T) -> ())] = []
    
    func addHandler(_ handler: (@escaping (T) ->())) {
        handler(wrappedValue)
        handlers.append(handler)
    }
    
    init(value: T) {
        self.value = value
    }
}
