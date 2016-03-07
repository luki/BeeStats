//
//  MasterViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 05/03/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var Favorites: UITableView!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        Favorites.dataSource = self
        Favorites.delegate = self
        Favorites.reloadData()
        
        updateNBBG()
        addLogoToNavBar()
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: "pullRefresh:", forControlEvents: .ValueChanged)
        Favorites.addSubview(refresh)
        
    }
    
    func pullRefresh(sender: UIRefreshControl) {
        Favorites.reloadData()
        sender.endRefreshing()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = Favorites.dequeueReusableCellWithIdentifier("aFavoritePlayer", forIndexPath: indexPath) as! FavoritePlayerTableViewCell
        
        let hiveDowload = DownloadUserProfile()
        hiveDowload.downloadJSON(favoritePlayers[indexPath.row]) {
            (let player) in
            
            dispatch_async(dispatch_get_main_queue()) {
                if let currentPlayer = player {
                    myCell.usernameTextLabel.text = currentPlayer.username
                    
                    myCell.profileImageView.image = self.profilePhoto(currentPlayer.username!)
                    myCell.rankNameLabel.text = currentPlayer.rankName
                    myCell.rankNameLabel.textColor = UIColor.whiteColor()
                    let currentRankName = currentPlayer.rankName!
                    
                    switch currentRankName {
                    case "Senior Hive Moderator": myCell.rankNameLabel.text = "Senior Moderator"
                    myCell.rankNameLabel.layer.backgroundColor = UIColor(red: 159.0/255.0, green: 37.0/255.0, blue: 30.0/255.0, alpha: 1.0).CGColor
                    case "Hive Moderator": myCell.rankNameLabel.text = "Moderator"
                    myCell.rankNameLabel.layer.backgroundColor = UIColor(red: 223.0/255.0, green: 75.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
                    case "Hive Admin": myCell.rankNameLabel.text = "Developer"
                    myCell.rankNameLabel.layer.backgroundColor = UIColor(red: 109.0/255.0, green: 109.0/255.0, blue: 109.0/255.0, alpha: 1.0).CGColor
                    case "Diamond Hive Member": myCell.rankNameLabel.text = "Diamond Member"
                    myCell.rankNameLabel.layer.backgroundColor = UIColor(red: 30.0/255.0, green: 173.0/255.0, blue: 177.0/255.0, alpha: 1.0).CGColor
                    default: myCell.rankNameLabel.text = "Regular Member"
                    myCell.rankNameLabel.layer.backgroundColor = UIColor(red: 34.0/255.0, green: 97.0/255.0, blue: 153.0/255.0, alpha: 1.0).CGColor
                    }
                    
                }
            }
        }
        
        return myCell

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePlayers.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        favoritePlayers.removeAtIndex(indexPath.row)
        Favorites.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        username = favoritePlayers[indexPath.row]
        performSegueWithIdentifier("showUser", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showUser" {
            let controller = segue.destinationViewController as! ProfileViewController
            controller.username = username
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        username = searchBar.text!
        performSegueWithIdentifier("showUser", sender: searchBar)
        resignFirstResponder()
    }
    
    func profilePhoto(username: String) -> UIImage {
        let url = NSURL(string: "https://avatar.hivemc.com/avatar/\(username)/500")
        if let data = NSData(contentsOfURL: url!) {
            return UIImage(data: data)!
        } else {
            return UIImage(named: "default_profileImage.png")!
        }
    }
    
    func addLogoToNavBar() {
        let image = UIImage(named: "bs_logo.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 28))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    func updateNBBG() {
        let currentWidth: CGFloat = view.frame.size.width
        
        if currentWidth == 320.0 {
            
            if let image320 = UIImage(named: "640") {
                navigationController?.navigationBar.setBackgroundImage(image320, forBarMetrics: .Default)
                print("Image")
            }
        } else if currentWidth == 375.0 {
            if let image350 = UIImage(named: "750") {
                navigationController?.navigationBar.setBackgroundImage(image350, forBarMetrics: .Default)
            }
        } else if currentWidth == 414.0 {
            if let image414 = UIImage(named: "1080") {
                navigationController?.navigationBar.setBackgroundImage(image414, forBarMetrics: .Default)
            }
        }
    }

}
