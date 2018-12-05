//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmTextfield: UITextField!
    @IBOutlet weak var alarmEnableButton: UIButton!
    
    var alarm: Alarm? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    var alarmIsOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        saveAlarm()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        print("print \(sender.date)")
    
    }
    
    func saveAlarm() {
        
        let fireDate = datePicker.date, enabled = alarmIsOn
        guard let name = alarmTextfield.text, !name.isEmpty else { return }
        if let alarm = alarm {
            AlarmController.shared.update(alarm: alarm, fireDate: fireDate, name: name, enabled: enabled)
        } else {
            AlarmController.shared.addAlarm(fireDate: fireDate, name: name, enabled: enabled)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {

        if let alarm = alarm {
            alarmTextfield.text = alarm.name
            datePicker.date = alarm.fireDate
            self.title = "Edit Alarm"
            
            if alarm.enabled == true {
                alarmEnableButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                alarmEnableButton.setTitle("ON", for: .normal)
            } else {
                self.title = "Add Alarm"
                self.alarmEnableButton.setTitle("Off", for: .normal
                    )
            }
        }
    }

}
