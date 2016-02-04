//
//  ViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit
import Material

class MasterViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var FavoritePlayers: UITableView!
    
    @IBOutlet weak var navBarImage: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let hello: [String] = ["my name0","my name1","my name2"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hello.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let myCell = FavoritePlayers.dequeueReusableCellWithIdentifier("aFavoritePlayer", forIndexPath: indexPath) as! FavoritePlayerTableViewCell
        
        myCell.usernameTextLabel.text = hello[indexPath.row]
        myCell.usernameTextLabel.font = RobotoFont.lightWithSize(16)
        
        myCell.rankNameLabel.text = "Moderator"
        myCell.rankNameLabel.font = RobotoFont.mediumWithSize(11)
        myCell.rankNameLabel.textColor = MaterialColor.red.base
        
        /*
        let url = NSURL(string: "https://avatar.hivemc.com/avatar/\(hello[indexPath.row])/500")
        if let data = NSData(contentsOfURL: url!) {
            myCell.profileImageView.image = UIImage(data: data)
        } else {
            myCell.profileImageView.image = UIImage(named: "default.png")
            
        }*/
        
        
        return myCell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavBar()
        searchBar.delegate = self
        FavoritePlayers.dataSource = self
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSegueWithIdentifier("showUser", sender: searchBar)
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
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 34))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    }