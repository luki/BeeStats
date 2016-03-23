//
//  Networks.swift
//  BeeStats
//
//  Created by Lukas A. Müller Rolfs on 1/24/16.
//  Copyright © 2016 Lukas A. Müller Rolfs. All rights reserved.
//

import Foundation
import UIKit

class Network {
    let URL: NSURL
    lazy var session = NSURLSession.sharedSession()
    
    typealias completion = ([String: AnyObject]? -> Void)
    
    init(url: NSURL) {
        URL = url
    }
    
    func requestDownload(theCompletion: completion) {
        let request = NSURLRequest(URL: URL)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    print("Succes")
                    let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data!, options: [])) as? [String: AnyObject]
                    theCompletion(jsonDictionary)
                default: print("Error")
                }
            } else {
                print("Error")
                
            }
        }
        
        task.resume()
    }
}