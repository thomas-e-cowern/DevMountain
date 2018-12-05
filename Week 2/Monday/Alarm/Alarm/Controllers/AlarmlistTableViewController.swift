//
//  AlarmlistTableViewController.swift
//  Alarm
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class AlarmlistTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlarmController.shared.alarms = AlarmController.shared.loadFromPersistenceStore()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.shared.alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viewAlarmDetail", for: indexPath) as? SwitchTableViewCell else { fatalError() }
        let alarm = AlarmController.shared.alarms[indexPath.row]
        cell.alarm = alarm
        cell.timeLabel.text = alarm.fireTimeAsString
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alarmToDelete = AlarmController.shared.alarms[indexPath.row]
            AlarmController.shared.delete(alarm: alarmToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditAlarm" {
            let destinationVC = segue.destination as? AlarmDetailTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let alarm = AlarmController.shared.alarms[indexPath.row]
                destinationVC?.alarm = alarm
            }
        }
    }
}

extension AlarmlistTableViewController: SwitchTableViewCellDelegate {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let alarmFromSourceOfTruth = AlarmController.shared.alarms[indexPath.row]
        alarmFromSourceOfTruth.enabled.toggle()
        cell.alarm = alarmFromSourceOfTruth
    }
    
    
}
