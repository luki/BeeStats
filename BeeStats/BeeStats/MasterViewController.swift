//
//  ViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var phoneWidth: CGFloat = 0.0
    var phoneHeight: CGFloat = 0.0
    
    @IBOutlet weak var FavoritePlayers: UITableView!
    @IBOutlet weak var navBarImage: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePlayers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let myCell = FavoritePlayers.dequeueReusableCellWithIdentifier("aFavoritePlayer", forIndexPath: indexPath) as! FavoritePlayerTableViewCell
            
            let hiveDowload = DownloadUserProfile()
            hiveDowload.downloadJSON(favoritePlayers[indexPath.row]) {
                (let player) in
                
                dispatch_async(dispatch_get_main_queue()) {
                    if let currentPlayer = player {
                        myCell.usernameTextLabel.text = currentPlayer.username
                        
                        myCell.profileImageView.image = self.profilePhoto(currentPlayer.username!)
                        myCell.rankNameLabel.text = currentPlayer.rankName
                        
                    }
                }
            }
        
        return myCell
        
    }
    
    func profilePhoto(username: String) -> UIImage {
        let url = NSURL(string: "https://avatar.hivemc.com/avatar/\(username)/500")
        if let data = NSData(contentsOfURL: url!) {
            return UIImage(data: data)!
        } else {
            return UIImage(named: "default_profileImage.png")!
        }

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        favoritePlayers.removeAtIndex(indexPath.row)
        FavoritePlayers.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneHeight = view.frame.size.height
        phoneWidth = view.frame.size.width
        
        print(phoneWidth)
        
        addLogoToNavBar()
        searchBar.delegate = self
        FavoritePlayers.dataSource = self
        FavoritePlayers.reloadData()
        
        updateNBBG()
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: "pullRefresh:", forControlEvents: .ValueChanged)
        FavoritePlayers.addSubview(refresh)
    }
    
    func pullRefresh(sender: UIRefreshControl) {
        FavoritePlayers.reloadData()
        sender.endRefreshing()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSegueWithIdentifier("showUser", sender: searchBar)
        resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showUser" {
            let controller = segue.destinationViewController as! PlayerViewController
            controller.username = searchBar.text!
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
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "640"), forBarMetrics: .Default)
                print("Image")
            }
    }
    }
    
    }