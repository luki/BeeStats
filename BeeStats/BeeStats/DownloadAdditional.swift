//
//  DownloadStatus.swift
//  BeeStats
//
//  Created by Lukas A. Mueller on 08/02/16.
//  Copyright © 2016 Lukas A. Mueller. All rights reserved.
//

import Foundation

struct DownloadTheLab {
    var startingURL = NSURL(string: "https://old.hivemc.com/json/lab/")
    
    func downloadJSON(UUID: String, completion: (TheLab? -> Void)) {
        if let finalURL = NSURL(string: UUID, relativeToURL: startingURL) {
            let network = Network(url: finalURL)
            network.requestDownload {
                (let dictionary) in
                
                let currentLab = self.currentPlayerDictionary(dictionary)
                completion(currentLab)
            }
        } else {
            print("Error creating final URL")
        }
    }
    
    func currentPlayerDictionary(jsonDictionary: [String: AnyObject]?) -> TheLab? {
        if let Dictionary = jsonDictionary as? [String: AnyObject]? {
            return TheLab(dictionary: Dictionary!)
        } else {
            print("JSON dictionary returned nil for currently key")
            return nil
        }
    }
}

struct DownloadOITC{
    var startingURL = NSURL(string: "http://old.hivemc.com/json/oitc/")
    
    func downloadJSON(UUID: String, completion: (OITC? -> Void)) {
        if let finalURL = NSURL(string: UUID, relativeToURL: startingURL) {
            let network = Network(url: finalURL)
            network.requestDownload {
                (let dictionary) in
                
                let currentOITC = self.currentPlayerDictionary(dictionary)
                completion(currentOITC)
            }
        } else {
            print("Error creating final URL")
        }
    }
    
    func currentPlayerDictionary(jsonDictionary: [String: AnyObject]?) -> OITC? {
        if let Dictionary = jsonDictionary as? [String: AnyObject]? {
            return OITC(dictionary: Dictionary!)
        } else {
            print("JSON dictionary returned nil for currently key")
            return nil
        }
    }
}
