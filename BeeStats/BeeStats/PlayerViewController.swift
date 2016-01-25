//
//  PlayerViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var username = ""
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    @IBOutlet weak var tokensLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
            }
        // Do any additional setup after loading the view.

    func updateUI() {
        let hiveDowload = Download()
        hiveDowload.downloadJSON(username) {
            (let player) in
            
            dispatch_async(dispatch_get_main_queue()) {
            if let currentPlayer = player {
                self.usernameLabel.text = currentPlayer.username
                self.rankNameLabel.text = currentPlayer.rankName
                print(currentPlayer.username)
                // self.tokensLabel.text = currentPlayer.tokens!
                }
            }
        }
        
        /* Implement feature to choose either 
        1. Profile View: "https://avatar.hivemc.com/avatar/\(username)"
        2. 3D View: "http://94.23.196.111/3D/\/username)"
        */
        let url = NSURL(string: "https://avatar.hivemc.com/avatar/\(username)/80")
        let data = NSData(contentsOfURL: url!)
        userProfileImage.image = UIImage(data: data!)
    }
    
}
