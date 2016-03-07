//
//  DownloadJSON.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 1/25/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import Foundation

struct DownloadUserProfile {
    
    var startingURL = NSURL(string: "https://old.hivemc.com/json/userprofile/")
    
    func downloadJSON(username: String, completion: (Player? -> Void)) {
        if let finalURL = NSURL(string: username, relativeToURL: startingURL) {
            let network = Network(url: finalURL)
            network.requestDownload {
                (let dictionary) in
                
                let currentPlayer = self.currentPlayerDictionary(dictionary)
                completion(currentPlayer)
            }
        } else {
            print("Error creating final URL")
        }
    }
    
    func currentPlayerDictionary(jsonDictionary: [String: AnyObject]?) -> Player? {
        if let Dictionary = jsonDictionary as? [String: AnyObject]? {
            return Player(dictionary: Dictionary!)
        } else {
            print("JSON dictionary returned nil for currently key")
            return nil
        }
    }
}

struct DownladStatus {
    var startingURL = NSURL(string: "https://old.hivemc.com/json/userlocation/")
    
    func downloadJSON(username: String, completion: (Status? -> Void)) {
        if let finalURL = NSURL(string: username, relativeToURL: startingURL) {
            let network = Network(url: finalURL)
            network.requestDownload {
                (let dictionary) in
                
                let currentPlayer = self.currentPlayerDictionary(dictionary)
                completion(currentPlayer)
            }
        } else {
            print("Error creating final URL")
        }
    }
    
    func currentPlayerDictionary(jsonDictionary: [String: AnyObject]?) -> Status? {
        if let Dictionary = jsonDictionary as? [String: AnyObject]? {
            return Status(dictionary: Dictionary!)
        } else {
            print("JSON dictionary returned nil for currently key")
            return nil
        }
    }
}

