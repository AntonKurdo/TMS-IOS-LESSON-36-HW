//
//  ViewModel.swift
//  cntr
//
//  Created by Yury Vozleev on 15.04.2024.
//

import Foundation

class ViewModel: VM {
    
    var counter: Int {
        set {
            guard newValue >= 0, newValue <= 50 else { return }
            _counter = newValue
        }
        get { _counter }
    }
    
    @Bindable(value: 0)
    private var _counter
    
    func bindCounter(_ handler: (@escaping (Int) -> ())) {
        __counter.addHandler(handler)
    }
    
}

protocol VM {
    var counter: Int { get set }
    func bindCounter(_ handler: (@escaping (Int) -> ()))
}
