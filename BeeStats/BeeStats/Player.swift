//
//  Player.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/24/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import Foundation

class Player {
    let username: String?
    let rankName: String?
    let tokens: Int?
    
    init(dictionary: [String: AnyObject]) {
        username = dictionary["username"] as? String
        rankName = dictionary["rankName"] as? String
        tokens = dictionary["tokens"] as? Int
    }
}