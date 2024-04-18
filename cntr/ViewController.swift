import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    private var vm: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = ViewModel()
        print(vm.counter)
        vm.counter.map({String($0)}).bind(to: label.rx.text).disposed(by: vm.bag)
    }

    @IBAction func decrementCounter(_ sender: Any) {
        vm.decrementCounter(prevVal: label.text)
    }
    
    @IBAction func incrementCounter(_ sender: Any) {
        vm.incrementCounter(prevVal: label.text)
    }
}

