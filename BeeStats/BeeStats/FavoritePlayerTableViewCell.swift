//
//  FavoritePlayerTableViewCell.swift
//  BeeStats
//
//  Created by Lukas A. Müller Rolfs on 04/02/16.
//  Copyright © 2016 Lukas A. Müller Rolfs. All rights reserved.
//

import UIKit

class FavoritePlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
