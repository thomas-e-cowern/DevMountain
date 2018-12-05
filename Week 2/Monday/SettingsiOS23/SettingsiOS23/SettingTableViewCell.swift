//
//  SettingTableViewCell.swift
//  SettingsiOS23
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

protocol SettingTableViewCellDelegate: class {
    func toggleSetting(for call: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {
    
     // MARK - Properties
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    weak var delegate: SettingTableViewCellDelegate?
    
    // MARK: - Landingpad
    var setting: Setting? {
        didSet { // Property Observer
            updateViews()
        }
    }
    
    // MARK - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateViews() {
        if let setting = setting {
            settingImageView.image = setting.image
            nameLabel.text = setting.name
            toggleSwitch.isOn = setting.isActive
            if setting.isActive == true {
                self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            } else {
                self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
    // MARK - Actions
    @IBAction func switchToggled(_ sender: Any) {
        delegate?.toggleSetting(for: self)
    }
}
