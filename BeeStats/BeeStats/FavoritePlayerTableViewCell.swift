//
//  FavoritePlayerTableViewCell.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 04/02/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
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
