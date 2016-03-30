//
//  oneStatTableViewCell.swift
//  BeeStats
//
//  Created by Lukas A. Müller Rolfs on 06/03/16.
//  Copyright © 2016 Lukas A. Müller Rolfs. All rights reserved.
//

import UIKit

class oneStatTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    
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
