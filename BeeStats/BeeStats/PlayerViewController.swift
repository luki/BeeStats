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
                self.tokensLabel.text = "\(currentPlayer.tokens!) Tokens"
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
        let data = NSData(contentsOfURL: url!)
        userProfileImage.image = UIImage(data: data!)
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
