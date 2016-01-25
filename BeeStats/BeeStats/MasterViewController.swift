//
//  ViewController.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/23/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func search(sender: AnyObject) {
        performSegueWithIdentifier("showUser", sender: sender)
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showUser" {
            let controller = segue.destinationViewController as! PlayerViewController
            controller.username = textField.text!
        }
    }

}

