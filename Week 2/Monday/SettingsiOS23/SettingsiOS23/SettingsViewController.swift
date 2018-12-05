//
//  SettingsViewController.swift
//  SettingsiOS23
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableviewmDelegate and Datasource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingController.shared.settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else { fatalError() }
        let setting = SettingController.shared.settings[indexPath.row]
        cell.setting = setting
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SettingsViewController: SettingTableViewCellDelegate {
    func toggleSetting(for cell: SettingTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let settingFromSourceOfTruth = SettingController.shared.settings[indexPath.row]
        settingFromSourceOfTruth.isActive.toggle()
        cell.setting = settingFromSourceOfTruth
    }
    
    
}
