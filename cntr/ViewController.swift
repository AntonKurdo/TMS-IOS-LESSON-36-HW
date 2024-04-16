//
//  ViewController.swift
//  cntr
//
//  Created by Yury Vozleev on 15.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    private var vm: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = ViewModel()
        vm.bindCounter { self.label.text = "\($0)" }
    }

    @IBAction func decrementCounter(_ sender: Any) {
        vm.counter -= 1
    }
    
    @IBAction func incrementCounter(_ sender: Any) {
        vm.counter += 1
    }
    
}

