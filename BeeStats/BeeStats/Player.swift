//
//  Player.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/24/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import Foundation

class Player {
    
    // GENERAL
    let username: String?
    let rankName: String?
    let UUID: String?
    let tokens: Int?
    
    // SURVIVAL GAMES
    let victories: Int?
    let kills: Int?
    let deaths: Int?
    let deathmatches: Int?
    let points: Int?
    
    // TROUBLE IN MINEVILLE
    let detective: Int?
    let innocent: Int?
    let traitor: Int?
    let mostPoints: Int?
    let karma: Int?
    
    // THE HEROBRINE
    let captures: Int?
    let hbKills: Int?
    let hbDeaths: Int?
    let hbKD: Double?
    let hbPoints: Int?
    
    // HIDE 'N SEEK
    let hnsVictories: Int?
    let hiderKills: Int?
    let seekerKills: Int?
    let hnsDeaths: Int?
    let hnsPoints: Int?
    
    //SPLEGG
    let played: Int?
    let eggs: Int?
    let blocks: Int?
    let spDeaths: Int?
    let spPoints: Int?
    
    //OITC
    let oitcVictories: Int?
    let oitcKills: Int?
    let oitcDeaths: Int?
    let arrowsFired: Int?
    let arrowsHit: Int?
    
    //COWBOYS & INDIANS
    let caiVictories: Int?
    let caiPlayed: Int?
    let caught: Int?
    let caiPoints: Int?
    let caiCaught: Int?
    
    //BLOCKPARTY
    let bpVictories: Int?
    let totalPoints: Int?
    let totalEliminations: Int?
    let totalPlacing: Int?
    let bpPlayed: Int?
    
    //SG: Heroes
    let sghVictories: Int?
    let sghKills: Int?
    let sghDeaths: Int?
    let ovoWins: Int?
    let sghTotalPoints: Int?
    
    //DEATHRUN
    let drVictories: Int?
    let drKills: Int?
    let drDeaths: Int?
    let drPlayed: Int?
    let drTotalPoints: Int?
    
    //THE LAB
    //ETC
    
    init(dictionary: [String: AnyObject]) {
        if let usernameValue = dictionary["username"] as? String {
            username = usernameValue
        } else {
            username = "Non Existent"
        }
        rankName = dictionary["rankName"] as? String
        tokens = dictionary["tokens"] as? Int
        if let UUIDvalue = dictionary["UUID"] as? String {
            UUID = UUIDvalue
        } else {
            UUID = "3365e0769ea34787bc76d808c85d5e79"
        }
        
        if let timv = dictionary["timv"] as? [String: AnyObject] {
            detective = timv["detective"] as? Int
            innocent = timv["innocent"] as? Int
            traitor = timv["traitor"] as? Int
            mostPoints = timv["mostPoints"] as? Int
            karma = timv["karma"] as? Int
        } else {
            detective = 0
            innocent = 0
            traitor = 0
            mostPoints = 0
            karma = 0
        }
        
        if let sg = dictionary["sg"] as? [String: AnyObject] {
            victories = sg["victories"] as? Int
            kills = sg["kills"] as? Int
            deaths = sg["deaths"] as? Int
            deathmatches = sg["deathmatches"] as? Int
            points = sg["points"] as? Int
        } else {
            victories = 0
            kills = 0
            deaths = 0
            deathmatches = 0
            points = 0
        }
        
        if let hb = dictionary["hb"] as? [String: AnyObject] {
            captures = hb["captures"] as? Int
            hbKills = hb["kills"] as? Int
            hbDeaths = hb["deaths"] as? Int
            hbKD = hb["kd"] as? Double
            hbPoints = hb["points"] as? Int
        } else {
            captures = 0
            hbKills = 0
            hbDeaths = 0
            hbKD = 0
            hbPoints = 0
        }
        
        if let hns = dictionary["hns"] as? [String: AnyObject] {
            hnsVictories = hns["victories"] as? Int
            hiderKills = hns["hiderKills"] as? Int
            seekerKills = hns["seekerKills"] as? Int
            hnsDeaths = hns["deaths"] as? Int
            hnsPoints = hns["points"] as? Int
        } else {
            hnsVictories = 0
            hiderKills = 0
            seekerKills = 0
            hnsDeaths = 0
            hnsPoints = 0
        }
        
        if let sp = dictionary["sp"] as? [String: AnyObject] {
            played = sp["played"] as? Int
            eggs = sp["eggs"] as? Int
            blocks = sp["blocks"] as? Int
            spDeaths = sp["deaths"] as? Int
            spPoints = sp["points"] as? Int
        } else {
            played = 0
            eggs = 0
            blocks = 0
            spDeaths = 0
            spPoints = 0
        }
        
        if let oitc = dictionary["oitc"] {
            oitcVictories = oitc["victories"] as? Int
            oitcKills = oitc["kills"] as? Int
            oitcDeaths = oitc["deaths"] as? Int
            arrowsFired = oitc["arrowsfired"] as? Int
            arrowsHit = oitc["arrowshit"] as? Int
        } else {
            oitcVictories = 0
            oitcKills = 0
            oitcDeaths = 0
            arrowsFired = 0
            arrowsHit = 0
        }
        
        if let cai = dictionary["cowboys"] as? [String: AnyObject] {
            caiVictories = cai["victories"] as? Int
            caiPlayed = cai["played"] as? Int
            caught = cai["caught"] as? Int
            caiPoints = cai["points"] as? Int
            caiCaught = cai["caught"] as? Int
        } else {
            caiVictories = 0
            caiPlayed = 0
            caught = 0
            caiPoints = 0
            caiCaught = 0
        }
        
        if let bp = dictionary["blockparty"] as? [String: AnyObject] {
            bpVictories = bp["victories"] as? Int
            totalPoints = bp["total_points"] as? Int
            totalEliminations = bp["total_eliminations"] as? Int
            totalPlacing = bp["total_placing"] as? Int
            bpPlayed = bp["games_played"] as? Int
        } else {
            bpVictories = 0
            totalPoints = 0
            totalEliminations = 0
            totalPlacing = 0
            bpPlayed = 0
        }
        
        if let sgh = dictionary["heroes"] as? [String: AnyObject] {
            sghVictories = sgh["victories"] as? Int
            sghKills = sgh["kills"] as? Int
            sghDeaths = sgh["deaths"] as? Int
            ovoWins = sgh["one_vs_ones_wins"] as? Int
            sghTotalPoints = sgh["total_points"] as? Int
        } else {
            sghVictories = 0
            sghKills = 0
            sghDeaths = 0
            ovoWins = 0
            sghTotalPoints = 0
        }
        
        if let dr = dictionary["deathrun"] as? [String: AnyObject] {
            drVictories = dr["victories"] as? Int
            drKills = dr["kills"] as? Int
            drDeaths = dr["deaths"] as? Int
            drPlayed = dr["games_played"] as? Int
            drTotalPoints = dr["total_points"] as? Int
        } else {
            drVictories = 0
            drKills = 0
            drDeaths = 0
            drPlayed = 0
            drTotalPoints = 0
        }
    }
}


struct Status {
    
    let status: String?
    let game: String?
    
    init(dictionary: [String:AnyObject]) {
        status = dictionary["status"] as? String
        game = dictionary["game"] as? String
    }
}