//
//  PlayerViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit
import Material

class PlayerViewController: UIViewController {
    
    var username = ""
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    @IBOutlet weak var tokensLabel: UILabel!
    
    var addFavoriteActive = false
    
    var screenwidth : CGFloat!
    var screenheight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavBar()
        updateUI()
        // Get Screensize of Device
        screenwidth = self.view.frame.size.width
        screenheight = self.view.frame.size.height
    
        let favoriteImg: UIImage? = UIImage(named: "ic_add_white_18dp")
        let addToFavorites = FabButton(frame: CGRectMake(screenwidth-84, screenheight-84, 64, 64))
        addToFavorites.backgroundColor = MaterialColor.brown.base
        addToFavorites.setImage(favoriteImg, forState: .Normal)
        addToFavorites.setImage(favoriteImg, forState: .Highlighted)
        view.addSubview(addToFavorites)
        addToFavorites.addTarget(self, action: "favorite:", forControlEvents: .TouchUpInside)
    }
        // Do any additional setup after loading the view.
    
    func favorite(sender: FabButton!) {
        print("Hello")
        alertFavoriteUser()
    }
    
    func addLogoToNavBar() {
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 34))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    func alertFavoriteUser() {
        if addFavoriteActive == false {
        let cardView: CardView = CardView()
        
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Adding \(username)"
        titleLabel.textColor = MaterialColor.brown.darken1
        titleLabel.font = RobotoFont.mediumWithSize(20)
        cardView.titleLabel = titleLabel
        
        let detailLabel: UILabel = UILabel()
        detailLabel.text = "You are about to add xpaperx to your favorites. This player will be displayed on the main screen."
        detailLabel.numberOfLines = 0
        cardView.detailLabel = detailLabel
        
        let add: FlatButton = FlatButton()
        add.pulseColor = MaterialColor.brown.lighten1
        add.pulseFill = true
        add.pulseScale = false
        add.setTitle("ADD", forState: .Normal)
        add.setTitleColor(MaterialColor.brown.darken1, forState: .Normal)
        
        let cancel: FlatButton = FlatButton()
        cancel.pulseColor = MaterialColor.brown.lighten1
        cancel.pulseFill = true
        cancel.pulseScale = false
        cancel.setTitle("CANCEL", forState: .Normal)
        cancel.setTitleColor(MaterialColor.brown.darken1, forState: .Normal)
        
        cardView.leftButtons = [add, cancel]
        
        // To support orientation changes, use MaterialLayout.
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: cardView, top: 100)
        MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
            addFavoriteActive = true
        } else {
            print("Opened already!")
        }
        
        }

    func updateUI() {
        let hiveDowload = Download()
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
                        self.rankNameLabel.backgroundColor = MaterialColor.teal.base
                    } else {
                    
                    switch rankName {
                        
                    case "Hive Moderator": self.rankNameLabel?.text = "Moderator"
                        self.rankNameLabel.backgroundColor = UIColor(red: 223.0/255.0, green: 75.0/255.0, blue: 63.0/255.0, alpha: 1.0)
                        
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
            userProfileImage.image = UIImage(named: "default.png")
        }
    }
    
    // MARK: - Table view data source
    
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("oneStatCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    }
    /*
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    */
}
