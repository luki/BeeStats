//
//  PlayerStatus.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 08/02/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import Foundation

struct Status {
    
    let status: String?
    let game: String?
    
    init(dictionary: [String:AnyObject]) {
        status = dictionary["status"] as? String
        game = dictionary["game"] as? String
    }
}