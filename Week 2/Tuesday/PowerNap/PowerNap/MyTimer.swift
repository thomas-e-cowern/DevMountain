//
//  MyTimer.swift
//  PowerNap
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func timerSecondTicked()
    func timerStopped()
    func timerCompleted()
}

class MyTimer {
    private var timer: Timer?
    weak var delegate: MyTimerDelegate?
    
    // time left
    var timeLeft: TimeInterval?
    
    // timer is on
    var isOn: Bool {
        if timeLeft == nil {
            return false
        } else {
            return true
        }
    }
    
    // Function Start Timer
    func startTimer(_ time: TimeInterval) {
        print("Timer Start")
        if isOn {
            // Do nothing
            print("mistake was mage, timer should not be restrted")
        } else {
            timeLeft = time
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    
    // Function Stop Timer
    func stopTimer() {
        self.timeLeft = nil
        timer?.invalidate()
        delegate?.timerStopped()
        print("Stop timer")
    }
    
    // Time left as string
    func timeLeftAsString() -> String {
        let timeRemaining = Int(self.timeLeft ?? 20 * 60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft * 60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }
    
    // Private method when second ticks by
    func secondTicked() {
        // Check time remaining
        guard let timeLeft = timeLeft else {
            print("Someone forgot to set the time left")
            return
        }
        
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(self.timeLeftAsString())
            delegate?.timerSecondTicked()
        } else {
            self.timeLeft = nil
            timer?.invalidate()
            print("Stop timer")
            delegate?.timerCompleted()
        }
        
    }

}
