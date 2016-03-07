//
//  SkyWars.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 07/03/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import Foundation

struct TheLab {
    let victories: Int?
    let played: Int?
    let points: Int?
    
    init(dictionary: [String: AnyObject]) {
        if let Dic = dictionary as? [String: AnyObject] {
            victories = Dic["total_victories"] as? Int
            played = Dic["total_played"] as? Int
            points = Dic["total_points"] as? Int
        } else {
            victories = 0
            played = 0
            points = 0
        }
    }
}

struct OITC {
    let victories: Int?
    let kills: Int?
    let deaths: Int?
    let arrowsFired: Int?
    let points: Int?
    
    init(dictionary: [String: AnyObject]) {
        if let Dic = dictionary as? [String: AnyObject] {
            victories = Dic["victories"] as? Int
            kills = Dic["kills"] as? Int
            deaths = Dic["deaths"] as? Int
            arrowsFired = Dic["arrowsfired"] as? Int
            points = Dic["total_points"] as? Int
        } else {
            victories = 0
            kills = 0
            deaths = 0
            arrowsFired = 0
            points = 0
        }
    }
}