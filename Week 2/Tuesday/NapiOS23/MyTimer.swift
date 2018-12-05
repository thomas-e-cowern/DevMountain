//
//  MyTimer.swift
//  NapiOS23
//
//  Created by Thomas Cowern New on 12/4/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

protocol MyTimerDelegate: class {
    func timerSecondTickedBy()
    func timerCompleted()
    func timerStopped()
}

class MyTimer: NSObject {

    var timeRemaining: TimeInterval?
    var timer: Timer?
    
    var isOn: Bool {
        return timeRemaining != nil
    }
    
    weak var delegate: MyTimerDelegate?
    
    func countDownOneSecond() {
        guard let timeRemaining = timeRemaining else { return }
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            delegate?.timerSecondTickedBy()
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
            delegate?.timerCompleted()
        }
    }
    
    func startTimer(_ time: TimeInterval) {
        timeRemaining = time
        DispatchQueue.main.async {
//            self.countDownOneSecond()
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                self.countDownOneSecond()
            })
        }
    }
    
    func stopTimer() {
        timeRemaining = nil
        delegate?.timerStopped()
    }
    
    func timeAsString() -> String {
        let timeRemaining = Int(self.timeRemaining ?? 20 * 60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft * 60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }
}
