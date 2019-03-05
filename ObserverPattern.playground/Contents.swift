import UIKit

protocol PropertyObserver {
    func updateState ()
}

protocol Observable: class {
    var observers: [PropertyObserver] { get set }
    func addObserver(_ observer: PropertyObserver)
//    func removeObserver(_ observer: PropertyObserver)
    func notify()
}

extension Observable {
    func addObserver(_ observer: PropertyObserver) {
        observers.append(observer)
    }
    
    //    func removeObserver(_ observer: PropertyObserver) {
    //        <#code#>
    //    }
    
    func notify() {
        for observer in observers {
            observer.updateState()
        }
    }
}

class Gondor: Observable {
    var observers: [PropertyObserver] = []
    func sauronIsComing() {
        notify()
    }
}

let gondor = Gondor()

class Rohan: PropertyObserver {
    var observable: Observable = Gondor()
    func updateState() {
        print("Rohan is sending troops to \(observable)")
    }
}

class Rivendale: PropertyObserver {
    var observable: Observable = Gondor()
    func updateState() {
        print("Rivendale is sending troops to \(observable)")
    }
}

gondor.addObserver(Rohan())
gondor.addObserver(Rivendale())
gondor.sauronIsComing()
