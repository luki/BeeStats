//
//  StatTableViewCell.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 04/02/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit

class StatTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
