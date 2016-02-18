//
//  PlayerViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController, UITableViewDataSource {
    
    @IBAction func addFavorite(sender: AnyObject) {
        favoriteAlert()
    }
    
    func favoriteAlert() {
        let alert = UIAlertController(title: "Adding \(usernameLabel.text) to favorites", message: "You are about to add this player to your favorites.", preferredStyle: .ActionSheet)
        
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
    
    /*
    var buttonBeep : AVAudioPlayer?
    var secondBeep : AVAudioPlayer?
    var backgroundMusic : AVAudioPlayer?
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
*/
    
    var username = ""
    
    @IBOutlet weak var statTableView: UITableView!
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    @IBOutlet weak var tokensLabel: UILabel!
    @IBOutlet weak var locationAndStatus: UILabel!
    
    var items = [[Player]]()
    
    var addFavoriteActive = false // Using for checking if add to favorite alert is opened
    
    var screenwidth : CGFloat!
    var screenheight : CGFloat!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let statCell = statTableView.dequeueReusableCellWithIdentifier("oneStatCell", forIndexPath: indexPath) as! StatTableViewCell
        
        return statCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavBar()
        updateUI()
        // Get Screensize of Device
        screenwidth = self.view.frame.size.width
        screenheight = self.view.frame.size.height
        
        statTableView.dataSource = self
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: "pullRefresh:", forControlEvents: .ValueChanged)
        statTableView.addSubview(refresh)
        
        /*
        if let buttonBeep = self.setupAudioPlayerWithFile("ButtonTap", type:"wav") {
            self.buttonBeep = buttonBeep
        }
        if let secondBeep = self.setupAudioPlayerWithFile("SecondBeep", type:"wav") {
            self.secondBeep = secondBeep
        }
        if let backgroundMusic = self.setupAudioPlayerWithFile("HallOfTheMountainKing", type:"mp3") {
            self.backgroundMusic = backgroundMusic
        }
        */
    }
        // Do any additional setup after loading the view.
    
    func pullRefresh(sender: UIRefreshControl) {
        updateUI()
        //buttonBeep?.play()
        sender.endRefreshing()
    }
    
    func addLogoToNavBar() {
        let image = UIImage(named: "bs_logo.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 28))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    func addFavoriteButton () {
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
                print("Already in array!")
            } else {
                favoritePlayers.append(username)
            }
        } else {
            favoritePlayers.append(username)
        }
    }

    func updateUI() {
        
        let statusDownload = DownladStatus()
        statusDownload.downloadJSON(username) {
            (let status) in
            
            dispatch_async(dispatch_get_main_queue()) {
                if let currentStatus = status {
                    if let playerStatus = currentStatus.status {
                        if let playerLocation = currentStatus.game {
                            if playerStatus == "Currently hibernating in " {
                                self.locationAndStatus?.text = "\(playerStatus)\(playerLocation)"
                            } else {
                                self.locationAndStatus?.text = "\(playerStatus) \(playerLocation)"
                                print(playerStatus)
                                print(playerLocation)
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
                if let username = currentPlayer.username {
                    self.usernameLabel?.text = "\(username)"
                }
                if let rankName = currentPlayer.rankName {
                    
                    if currentPlayer.username == "lukeatit" || currentPlayer.username == "Winner" {
                        self.rankNameLabel?.text = "App Creator"
                        self.rankNameLabel.backgroundColor = UIColor.blueColor()
                    } else if currentPlayer.username == "xpaperx" {
                        self.rankNameLabel?.text = "lukeatit's girlfriend"
                        self.rankNameLabel.backgroundColor = UIColor.purpleColor()
                    } else {
                    
                    switch rankName {
                    
                    case "Senior Hive Moderator": self.rankNameLabel?.text = "Senior Moderator"
                        self.rankNameLabel.backgroundColor = UIColor(red: 159.0/255.0, green: 37.0/255.0, blue: 30.0/255.0, alpha: 1.0)

                        
                    case "Hive Moderator": self.rankNameLabel?.text = "Moderator"
                        self.rankNameLabel.backgroundColor = UIColor(red: 223.0/255.0, green: 75.0/255.0, blue: 63.0/255.0, alpha: 1.0)
                    
                    case "Hive Admin": self.rankNameLabel?.text = "Developer"
                    self.rankNameLabel.backgroundColor = UIColor(red: 109.0/255.0, green: 109.0/255.0, blue: 109.0/255.0, alpha: 1.0)

                        
                    case "Diamond Hive Member": self.rankNameLabel?.text = "Diamond Member"
                        self.rankNameLabel.backgroundColor = UIColor(red: 30.0/255.0, green: 173.0/255.0, blue: 177.0/255.0, alpha: 1.0)
                        
                    case "Lifetime Emerald Hive Member": self.rankNameLabel?.text = "Emerald Member"
                        self.rankNameLabel.backgroundColor = UIColor(red: 45.0/255.0, green: 199.0/255.0, blue: 63.0/255.0, alpha: 1.0)
                        
                    case "Hive Founder and Owner": self.rankNameLabel?.text = "Founder and Owner"
                        self.rankNameLabel.backgroundColor = UIColor(red: 237.0/255.0, green: 175.0/255.0, blue: 22.0/255.0, alpha: 1.0)
                        
                    case "VIP Player": self.rankNameLabel?.text = "VIP Player"
                        self.rankNameLabel.backgroundColor = UIColor(red: 170.0/255.0, green: 47.0/255.0, blue: 225.0/255.0, alpha: 1.0)
                        
                    default: self.rankNameLabel?.text = "Regular Member"
                        self.rankNameLabel.backgroundColor = UIColor(red: 34.0/255.0, green: 97.0/255.0, blue: 153.0/255.0, alpha: 1.0)

                    }
                    }
                }
                
                if let tokens = currentPlayer.tokens {
                    self.tokensLabel?.text = "\(tokens) Tokens"
                }
                
                print(currentPlayer.username)
                
                // SURVIVAL GAMES
                
                print(currentPlayer.arrowsFired)
                print(currentPlayer.arrowsHit)
                print(currentPlayer.blocks)
                print(currentPlayer.bpPlayed)
                print(currentPlayer.bpVictories)
                print(currentPlayer.caiCaught)
                print(currentPlayer.caiPlayed)
                print(currentPlayer.caiPoints)
                print(currentPlayer.caiVictories)
                print(currentPlayer.captures)
                print(currentPlayer.caught)
                print(currentPlayer.deathmatches)
                print(currentPlayer.deaths)
                print(currentPlayer.detective)
                print(currentPlayer.drDeaths)
                print(currentPlayer.drKills)
                print(currentPlayer.drPlayed)
                print(currentPlayer.drTotalPoints)
                print(currentPlayer.drVictories)
                print(currentPlayer.eggs)
                print(currentPlayer.hbDeaths)
                print(currentPlayer.hbKD)
                print(currentPlayer.hbKills)
                print(currentPlayer.hbPoints)
                print(currentPlayer.hiderKills)
                print(currentPlayer.hnsDeaths)
                print(currentPlayer.hnsPoints)
                print(currentPlayer.hnsVictories)
                print(currentPlayer.innocent)
                print(currentPlayer.karma)
                print(currentPlayer.kills)
                print(currentPlayer.mostPoints)
                print(currentPlayer.oitcDeaths)
                print(currentPlayer.oitcKills)
                print(currentPlayer.oitcVictories)
                print(currentPlayer.ovoWins)
                print(currentPlayer.played)
                print(currentPlayer.points)
                print(currentPlayer.seekerKills)
                print(currentPlayer.sghDeaths)
                print(currentPlayer.sghKills)
                print(currentPlayer.sghTotalPoints)
                print(currentPlayer.sghVictories)
                print(currentPlayer.spDeaths)
                print(currentPlayer.spPoints)
                print(currentPlayer.totalEliminations)
                print(currentPlayer.totalPlacing)
                print(currentPlayer.totalPoints)
                print(currentPlayer.traitor)
                print(currentPlayer.victories)
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
