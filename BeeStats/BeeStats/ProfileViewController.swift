//
//  ViewController.swift
//  BeeStats
//
//  Created by Lukas A. Müller Rolfs on 05/03/16.
//  Copyright © 2016 Lukas A. Müller Rolfs. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statisticsTableView: UITableView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    
    @IBOutlet weak var tokensLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var username = ""
    var addFavoriteActive = false // Using for checking if add to favorite alert is opened
    
    let typeForTable = [/* SG*/ ["Wins", "Kills", "Deaths", "Deathmatches", "Points"], /* TIMV */ ["Detective Points", "Innocent Points", "Traitor Points", "Most Points", "Karma"], /* HB*/["Shard Captues", "Kills", "Deaths", "K/D Ratio", "Points"], /* HIDE N SEEK */ ["Victories", "Kills as Hider", "Kills as Seeker", "Deaths", "Points"], /* SPLEGG */ ["Games Played", "Eggs fired", "Blocks Destroyed", "Deaths", "Points"], /* OITC */ ["Victories", "Kills", "Deaths", "Arrows Fired", "Points"], /* CAI */ ["Victories", "Games Played", "Caught", "Leader Captures", "Points"], /* BP */ ["Victories", "Eliminations", "Total Top 3's", "Games Played", "Points"], /* HEROES*/ ["Victories", "Kills", "Deaths", "1v1 Wins", "Points"], /* DR */ ["Victories", "Kills", "Deaths", "Games Played", "Points"], /* LAB */ ["Victories","Games Played","Points"]]
    
    var valuesForTable: [[AnyObject]] = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusView.layer.cornerRadius = statusView.bounds.size.width/2
        statusView.layer.masksToBounds = true
        
        updateUI()
        
        statisticsTableView.dataSource = self
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: "pullRefresh:", forControlEvents: .ValueChanged)
        statisticsTableView.addSubview(refresh)
    }

    func pullRefresh(sender: UIRefreshControl) {
        updateUI()
        sender.endRefreshing()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = statisticsTableView.dequeueReusableCellWithIdentifier("oneStatCell") as! oneStatTableViewCell
        cell.typeLabel.text = "\(typeForTable[indexPath.section][indexPath.row])"
        cell.valueLabel.text = "\(valuesForTable[indexPath.section][indexPath.row])"
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return typeForTable.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeForTable[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Survival Games"
        case 1: return "Trouble in MineVille"
        case 2: return "The Herobrine"
        case 3: return "Hide and Seek"
        case 4: return "Splegg"
        case 5: return "One in the Chamber"
        case 6: return "Cowboys & Indians"
        case 7: return "BlockParty"
        case 8: return "SG: Heroes"
        case 9: return "DeathRun"
        case 10: return "The Lab"
        default: return "Error"
        }
    }
    
    @IBAction func addFavorite(sender: AnyObject) {
        favoriteAlert()
    }
    
    
    func favoriteAlert() {
        let alert = UIAlertController(title: "Adding \(usernameLabel.text!) to favorites", message: "You are about to add this player to your favorites.", preferredStyle: .ActionSheet)
        
        let add = UIAlertAction(title: "Add", style: .Default) {
            (action) in
            
            self.addFavoriteButton()
        }
        
        alert.addAction(add)
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) {
            (action) in
            
            print("Cancelled")
        }
        
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    
    func addFavoriteButton () {
        if usernameLabel.text != "Non Existent" {
        if favoritePlayers.count != 0 {
            var inArray = false
            for i in 0 ... favoritePlayers.count - 1 {
                if favoritePlayers[i] != username {
                    inArray = false
                } else {
                    inArray = true
                    break // Stops when found
                }
                
            }
            if inArray == true {
                
                let alert = UIAlertController(title: "\(usernameLabel.text!) is already in your favorites and can not be added a second time", message: nil, preferredStyle: .Alert)
                
                let okay = UIAlertAction(title: "Okay", style: .Cancel) {
                    (action) in
                    
                    print("Okay")
                }
                
                alert.addAction(okay)
                presentViewController(alert, animated: true, completion: nil)
            } else {
                if username.lowercaseString == "xpaperx" && favoritePlayers[favoritePlayers.count-1].lowercaseString == "ininey" {
                    favoritePlayers.append(username)
                    coupleLove(favoritePlayers[favoritePlayers.count-2], name2: favoritePlayers[favoritePlayers.count-1])
                    print("ininey & xpaperx")
                } else if username.lowercaseString == "ininey" && favoritePlayers[favoritePlayers.count - 1].lowercaseString == "xpaperx" {
                    favoritePlayers.append(username)
                    print("xpaperx & ininey")
                    coupleLove(favoritePlayers[favoritePlayers.count-2], name2: favoritePlayers[favoritePlayers.count-1])
                } else {
                    favoritePlayers.append(username)
                }
            }
        } else {
            favoritePlayers.append(username)
        }
        } else {
            let nonexAlert = UIAlertController(title: "You can't add non-existent players", message: nil, preferredStyle: .Alert)
            
            let nonexAction = UIAlertAction(title: "Okay", style: .Default) {
                (alert) in
                
            }
            
            nonexAlert.addAction(nonexAction)
            presentViewController(nonexAlert, animated: true, completion: nil)
        }
    }
    
    func coupleLove(name1: String, name2: String) {
        let alert = UIAlertController(title: "Woops! You just found a couple that is madly in love!", message: nil, preferredStyle: .Alert)
        let action1 = UIAlertAction(title: "Sweet!", style: .Cancel) {
            (action) in
            let alert2 = UIAlertController(title: "Yeah, it is pretty sweet :3", message: nil, preferredStyle: .Alert)
            let action21 = UIAlertAction(title: "Yay", style: .Cancel) {
                (action) in
            }
            alert2.addAction(action21)
            self.presentViewController(alert2, animated: true, completion: nil)
        }
        alert.addAction(action1)
        let action2 = UIAlertAction(title: "Omg, remove 'em!", style: .Destructive) {
            (action) in
            let index = favoritePlayers.count
            favoritePlayers.removeAtIndex((index-1))
            favoritePlayers.removeAtIndex((index-2))
        }
        alert.addAction(action2)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    func updateUI() {
        
        let statusDownload = DownladStatus()
        statusDownload.downloadJSON(username) {
            (let status) in
            
            dispatch_async(dispatch_get_main_queue()) {
                if let currentStatus = status {
                    if let playerStatus = currentStatus.status {
                        if let playerLocation = currentStatus.game {
                            print(playerStatus)
                            if playerStatus == "Currently hibernating in " {
                                self.statusLabel.text = "Offline"
                                self.statusView.layer.backgroundColor = UIColor(red: 223.0/255.0, green: 75.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
                            } else if playerStatus != "Currently hibernating in "{
                                self.statusLabel.text = "Online"
                                self.statusView.layer.backgroundColor = UIColor(red: 52.0/255.0, green: 227.0/255.0, blue: 17.0/225.0, alpha: 1.0).CGColor
                            }
                        }
                    }
                }
            }
        }
        
        let hiveDowload = DownloadUserProfile()
        hiveDowload.downloadJSON(username) {
            (let player) in
            
            dispatch_async(dispatch_get_main_queue()) {
                if let currentPlayer = player {
                    if let cUsername = currentPlayer.username {
                        self.usernameLabel?.text = "\(cUsername)"
                    }
                    if let rankName = currentPlayer.rankName {
                        self.rankNameLabel.layer.cornerRadius = 3
                        if currentPlayer.username == "ininey" || currentPlayer.username == "Winner" {
                            self.rankNameLabel?.text = "App Creator"
                            self.rankNameLabel.layer.backgroundColor = UIColor.blueColor().CGColor // Converts to CGColor
                        } else if currentPlayer.username == "xpaperx" {
                            self.rankNameLabel?.text = "ininey's girlfriend"
                            self.rankNameLabel.layer.backgroundColor = UIColor.purpleColor().CGColor
                        } else {
                            
                            switch rankName {
                                
                            case "Senior Hive Moderator": self.rankNameLabel?.text = "Senior Moderator"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 159.0/255.0, green: 37.0/255.0, blue: 30.0/255.0, alpha: 1.0).CGColor
                                
                                
                            case "Hive Moderator": self.rankNameLabel?.text = "Moderator"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 223.0/255.0, green: 75.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
                                
                            case "Hive Admin": self.rankNameLabel?.text = "Developer"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 109.0/255.0, green: 109.0/255.0, blue: 109.0/255.0, alpha: 1.0).CGColor
                                
                                
                            case "Diamond Hive Member": self.rankNameLabel?.text = "Diamond Member"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 30.0/255.0, green: 173.0/255.0, blue: 177.0/255.0, alpha: 1.0).CGColor
                                
                            case "Lifetime Emerald Hive Member": self.rankNameLabel?.text = "Emerald Member"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 45.0/255.0, green: 199.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
                                
                            case "Hive Founder and Owner": self.rankNameLabel?.text = "Founder and Owner"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 237.0/255.0, green: 175.0/255.0, blue: 22.0/255.0, alpha: 1.0).CGColor
                                
                            case "VIP Player": self.rankNameLabel?.text = "VIP Player"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 170.0/255.0, green: 47.0/255.0, blue: 225.0/255.0, alpha: 1.0).CGColor
                                
                            default: self.rankNameLabel?.text = "Regular Member"
                            self.rankNameLabel.layer.backgroundColor = UIColor(red: 34.0/255.0, green: 97.0/255.0, blue: 153.0/255.0, alpha: 1.0).CGColor
                                
                            }
                        }
                    }
                    
                    if let tokens = currentPlayer.tokens {
                        self.tokensLabel?.text = "\(tokens) Tokens"
                    }
                    self.valuesForTable[0][0] = currentPlayer.victories!
                    self.valuesForTable[0][1] = currentPlayer.kills!
                    self.valuesForTable[0][2] = currentPlayer.deaths!
                    self.valuesForTable[0][3] = currentPlayer.deathmatches!
                    self.valuesForTable[0][4] = currentPlayer.points!
                    
                    self.valuesForTable[1][0] = currentPlayer.detective!
                    self.valuesForTable[1][1] = currentPlayer.innocent!
                    self.valuesForTable[1][2] = currentPlayer.traitor!
                    self.valuesForTable[1][3] = currentPlayer.mostPoints!
                    self.valuesForTable[1][4] = currentPlayer.karma!
                    
                    self.valuesForTable[2][0] = currentPlayer.captures!
                    self.valuesForTable[2][1] = currentPlayer.hbKills!
                    self.valuesForTable[2][2] = currentPlayer.hbDeaths!
                    self.valuesForTable[2][3] = currentPlayer.hbKD!
                    self.valuesForTable[2][4] = currentPlayer.hbPoints!
                    
                    self.valuesForTable[3][0] = currentPlayer.hnsVictories!
                    self.valuesForTable[3][1] = currentPlayer.hiderKills!
                    self.valuesForTable[3][2] = currentPlayer.seekerKills!
                    self.valuesForTable[3][3] = currentPlayer.hnsDeaths!
                    self.valuesForTable[3][4] = currentPlayer.hnsPoints!
                    
                    self.valuesForTable[4][0] = currentPlayer.played!
                    self.valuesForTable[4][1] = currentPlayer.eggs!
                    self.valuesForTable[4][2] = currentPlayer.blocks!
                    self.valuesForTable[4][3] = currentPlayer.spDeaths!
                    self.valuesForTable[4][4] = currentPlayer.spPoints!
                    
                    
                    let OITCDowload = DownloadOITC()
                    OITCDowload.downloadJSON(currentPlayer.UUID!) {
                        (let oitc) in
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            if let currentOITC = oitc{
                                self.valuesForTable[5][0] = currentOITC.victories!
                                self.valuesForTable[5][1] = currentOITC.kills!
                                self.valuesForTable[5][2] = currentOITC.deaths!
                                self.valuesForTable[5][3] = currentOITC.arrowsFired!
                                self.valuesForTable[5][4] = currentOITC.points!
                            }
                        }
                    }

                    
                    self.valuesForTable[6][0] = currentPlayer.caiVictories!
                    self.valuesForTable[6][1] = currentPlayer.caiPlayed!
                    self.valuesForTable[6][2] = currentPlayer.caught!
                    self.valuesForTable[6][3] = currentPlayer.caiCaught!
                    self.valuesForTable[6][4] = currentPlayer.caiPoints!
                    
                    self.valuesForTable[7][0] = currentPlayer.bpVictories!
                    self.valuesForTable[7][1] = currentPlayer.totalEliminations!
                    self.valuesForTable[7][2] = currentPlayer.totalPlacing!
                    self.valuesForTable[7][3] = currentPlayer.bpPlayed!
                    self.valuesForTable[7][4] = currentPlayer.totalPoints!
                    
                    self.valuesForTable[8][0] = currentPlayer.sghVictories!
                    self.valuesForTable[8][1] = currentPlayer.sghKills!
                    self.valuesForTable[8][2] = currentPlayer.sghDeaths!
                    self.valuesForTable[8][3] = currentPlayer.ovoWins!
                    self.valuesForTable[8][4] = currentPlayer.sghTotalPoints!
                    
                    self.valuesForTable[9][0] = currentPlayer.drVictories!
                    self.valuesForTable[9][1] = currentPlayer.drKills!
                    self.valuesForTable[9][2] = currentPlayer.drDeaths!
                    self.valuesForTable[9][3] = currentPlayer.drPlayed!
                    self.valuesForTable[9][4] = currentPlayer.drTotalPoints!
                    
                    let labDowload = DownloadTheLab()
                    labDowload.downloadJSON(currentPlayer.UUID!) {
                        (let lab) in
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            if let currentLab = lab {
                                self.valuesForTable[10][0] = currentLab.victories!
                                self.valuesForTable[10][1] = currentLab.played!
                                self.valuesForTable[10][2] = currentLab.points!
                            }
                        }
                    }
                    self.statisticsTableView.reloadData()
                }
            }

        }
        
        /* Implement feature to choose either 
        1. Profile View: "https://avatar.hivemc.com/avatar/\(username)"
        2. 3D View: "http://94.23.196.111/3D/\/username)"
        */
        let url = NSURL(string: "https://avatar.hivemc.com/avatar/\(username)/500")
        if let data = NSData(contentsOfURL: url!) {
            userProfileImage.image = UIImage(data: data)
        } else {
            userProfileImage.image = UIImage(named: "default_profileImage.png")
        }
}

}