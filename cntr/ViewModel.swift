import RxSwift

protocol VM {
    var counter: BehaviorSubject<Int> { get set }
    var bag: DisposeBag {get}
    func incrementCounter(prevVal: Int)
    func decrementCounter(prevVal: Int)
}

class ViewModel: VM {
    private enum Constants {
        static let minValue = 0
        static let maxValue = 50
    }
    
    var counter = BehaviorSubject<Int>(value: 0)
    var bag = DisposeBag()
    
    func incrementCounter(prevVal: Int) {
        let newVal = prevVal + 1
        if newVal <= Constants.maxValue {
            self.counter.onNext(newVal)
        }
    }
    
    func decrementCounter(prevVal: Int) {
        let newVal = prevVal - 1
        if newVal >= Constants.minValue {
            self.counter.onNext(newVal)
        }
    }
}


