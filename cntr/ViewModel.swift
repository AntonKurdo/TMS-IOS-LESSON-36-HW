import RxSwift

protocol VM {
    var counter: BehaviorSubject<Int> { get set }
    var bag: DisposeBag {get}
    func incrementCounter(prevVal: String?)
    func decrementCounter(prevVal: String?)
}

class ViewModel: VM {
    private enum Constants {
        static let minValue = 0
        static let maxValue = 50
    }
    
    var counter = BehaviorSubject<Int>(value: 0)
    var bag = DisposeBag()
    
    func incrementCounter(prevVal: String?) {
        guard let text = prevVal,  let currentVal = Int(text) else { return }
        
        let newVal = currentVal + 1
        if newVal <= Constants.maxValue {
            self.counter.onNext(newVal)
        }
    }
    
    func decrementCounter(prevVal: String?) {
        guard let text = prevVal,  let currentVal = Int(text) else { return }
        let newVal = currentVal - 1
        if newVal >= Constants.minValue {
            self.counter.onNext(newVal)
        }
    }
}


