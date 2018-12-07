//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Thomas Cowern New on 12/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTappped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskButtonCheckbox: UIButton!
    
    // MARK: - Properties
    weak var delegate: ButtonTableViewCellDelegate?
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    @IBAction func checkboxButtonPresses(_ sender: UIButton) {
        updateButton(true)
        delegate?.buttonCellButtonTappped(self)
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete == true {

            taskButtonCheckbox.setImage(UIImage(named: "check"), for: .normal)
        } else {

            taskButtonCheckbox.setImage(UIImage(named: "box"), for: .normal)
        }
    }
    
}

extension ButtonTableViewCell {
    func upate(withTask task: Task) {
        taskNameLabel.text = task.name
        updateButton(task.isComplete)
    }
}
