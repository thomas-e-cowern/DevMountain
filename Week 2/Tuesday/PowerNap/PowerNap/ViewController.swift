//
//  ViewController.swift
//  PowerNap
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timrButton: UIButton!
    
    var myTimer = MyTimer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTimer.delegate = self
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if myTimer.isOn {
            myTimer.stopTimer()
        } else {
            myTimer.startTimer(3)
            scheduleLocalAlert(timeInterval: 3)
        }
    }
    
    func updateLabelAndButton() {
        timerLabel.text = myTimer.timeLeftAsString()
        var title = "Start Nap"
        if myTimer.isOn {
            title = "Stop"
        }
        timrButton.setTitle(title, for: .normal)
    }
    
    func createAlertController() {
        let alert = UIAlertController(title: "Time to wake up", message: "Or is it?", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "I'm Up", style: .default, handler: nil)
        alert.addAction(dismissAction)
        
        let snoozeAction = UIAlertAction(title: "Snooze", style: .destructive) { (_) in
            let textField = alert.textFields?.first
            let timeAsString = textField?.text
            let timeAsDouble = Double(timeAsString!)!
            
            self.myTimer.startTimer(timeAsDouble * 60)
            self.scheduleLocalAlert(timeInterval: timeAsDouble * 60)
        }
        alert.addAction(snoozeAction)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Snooze for more minutes??"
            textField.keyboardType = .numberPad
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func scheduleLocalAlert(timeInterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "Subtitle"
        content.body = "Body"
        content.badge = 10
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (_) in
            print("User asked to get a local notofication")
        }
        
    }
    
}

extension ViewController: MyTimerDelegate {
    func timerSecondTicked() {
        updateLabelAndButton()
    }
    
    func timerStopped() {
        updateLabelAndButton()
    }
    
    func timerCompleted() {
        updateLabelAndButton()
        createAlertController()
    }
    
    
}
