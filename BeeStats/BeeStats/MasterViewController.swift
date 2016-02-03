//
//  ViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit
import Material

class MasterViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var FavoritePlayers: UITableView!
    
    @IBOutlet weak var navBarImage: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavBar()
        searchBar.delegate = self
        
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