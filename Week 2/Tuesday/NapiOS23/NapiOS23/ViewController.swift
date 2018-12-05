//
//  ViewController.swift
//  NapiOS23
//
//  Created by Thomas Cowern New on 12/4/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    let myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setView() {
        
        if myTimer.isOn {
            timerButton.setTitle("Cancel", for: .normal)
        } else {
            timerButton.setTitle("Start", for: .normal)
        }
        
        updateTimerLabel()
    }
    
    func updateTimerLabel() {
        timeLabel.text = myTimer.timeAsString()
    }
    
    func resetTimer() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            let napTimerNotifications = requests.filter{ $0.identifier == "NapNotification" }
            guard let napTimerNotification = napTimerNotifications.first else { return }
            let trigger = napTimerNotification.trigger as? UNCalendarNotificationTrigger
            guard let fireDate = trigger?.nextTriggerDate() else { return }
            self.myTimer.stopTimer()
            self.myTimer.startTimer(fireDate.timeIntervalSinceNow)
            
        }
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Snooze?", message: "No.....", preferredStyle: .alert)
        alertController.addTextField { (snoozeTextField) in
            snoozeTextField.placeholder = "More sleep?...."
        }
        let snoozeAction = UIAlertAction(title: "Sooze", style: .default) { (_) in
            guard let snoozeMinutes = alertController.textFields?.first?.text else { return }
            let seconds = (Double(snoozeMinutes) ?? 0) * 60
            self.myTimer.startTimer(seconds)
        }
        let dismissAction = UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil)
        alertController.addAction(snoozeAction)
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true)
    }
    
    func scheduleLocalNotification() {
        // What does the notification say
        let content = UNMutableNotificationContent()
        content.title = "Wake Up!"
        content.body = "Time to get up"
        // When it is going off
        guard let timeRemainimg = myTimer.timeRemaining else { return }
        let fireDate = Date(timeInterval: timeRemainimg, since: Date())
        let dateComponents = Calendar.current.dateComponents([.minute, .second], from: fireDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        // Submitting the request to send the user the information
        let request = UNNotificationRequest(identifier: "NapNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("😡There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            }
        }
    }
    
    func cancelLocalNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["NapNotification"])
    }

    @IBAction func toggleTimerButtonTapped(_ sender: Any) {
        if myTimer.isOn {
            myTimer.stopTimer()
            cancelLocalNotification()
        } else {
            myTimer.startTimer(3)
            scheduleLocalNotification()
        }
        setView()
    }
    
}

extension ViewController: MyTimerDelegate {
    
    func timerSecondTickedBy() {
        updateTimerLabel()
    }
    
    func timerCompleted() {
        setView()
        presentAlertController()
    }
    
    func timerStopped() {
        myTimer.timer?.invalidate()
        setView()
    }
    
}

