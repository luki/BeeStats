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
    let hbKD: Int?
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
        username = dictionary["username"] as? String
        rankName = dictionary["rankName"] as? String
        tokens = dictionary["tokens"] as? Int
        
        let timv = dictionary["timv"] as? [String: AnyObject]
        detective = timv!["detective"] as? Int
        innocent = timv!["innocent"] as? Int
        traitor = timv!["traitor"] as? Int
        mostPoints = timv!["mostPoints"] as? Int
        karma = timv!["karma"] as? Int
        
        let sg = dictionary["sg"]!
        victories = sg["victories"] as? Int
        kills = sg["kills"] as? Int
        deaths = sg["deaths"] as? Int
        deathmatches = sg["deathmatches"] as? Int
        points = sg["points"] as? Int
        
        let hb = dictionary["hb"]!
        captures = hb["captures"] as? Int
        hbKills = hb["kills"] as? Int
        hbDeaths = hb["deaths"] as? Int
        hbKD = hb["kd"] as? Int
        hbPoints = hb["points"] as? Int
        
        let hns = dictionary["hns"]!
        hnsVictories = hns["victories"] as? Int
        hiderKills = hns["hiderKills"] as? Int
        seekerKills = hns["seekerKills"] as? Int
        hnsDeaths = hns["deaths"] as? Int
        hnsPoints = hns["points"] as? Int
        
        let sp = dictionary["sp"]!
        played = sp["played"] as? Int
        eggs = sp["eggs"] as? Int
        blocks = sp["blocks"] as? Int
        spDeaths = sp["deaths"] as? Int
        spPoints = sp["points"] as? Int
        
        let oitc = dictionary["oitc"]!
        oitcVictories = oitc["victories"] as? Int
        oitcKills = oitc["kills"] as? Int
        oitcDeaths = oitc["deaths"] as? Int
        arrowsFired = oitc["arrowsfired"] as? Int
        arrowsHit = oitc["arrowshit"] as? Int
        
        let cai = dictionary["cowboys"]!
        caiVictories = cai["victories"] as? Int
        caiPlayed = cai["played"] as? Int
        caught = cai["caught"] as? Int
        caiPoints = cai["points"] as? Int
        caiCaught = cai["caught"] as? Int
        
        let bp = dictionary["blockparty"]!
        bpVictories = bp["victories"] as? Int
        totalPoints = bp["total_points"] as? Int
        totalEliminations = bp["total_eliminations"] as? Int
        totalPlacing = bp["total_placing"] as? Int
        bpPlayed = bp["games_played"] as? Int
        
        let sgh = dictionary["heroes"]!
        sghVictories = sgh["victories"] as? Int
        sghKills = sgh["kills"] as? Int
        sghDeaths = sgh["deaths"] as? Int
        ovoWins = sgh["one_vs_ones_wins"] as? Int
        sghTotalPoints = sgh["total_points"] as? Int
        
        let dr = dictionary["deathrun"]!
        drVictories = dr["victories"] as? Int
        drKills = dr["kills"] as? Int
        drDeaths = dr["deaths"] as? Int
        drPlayed = dr["games_played"] as? Int
        drTotalPoints = dr["total_points"] as? Int
    }
}