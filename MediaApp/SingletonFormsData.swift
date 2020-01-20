//
//  SingletonFormsData.swift
//  MediaApp
//
//  Created by R Shantha Kumar on 11/28/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import AVKit

class SingletonFormsData: NSObject {

    static var shared = SingletonFormsData()
    
    var serverData = [[String:Any]]()
    
    var selectedButton:Int?
    var buttonTapped:Int?
    
    
    
    var images = [UIImage]()
    var story = [String]()
    var songs = [[String]]()
    var videoData = [String]()
   var movieName = [String]()
    

   private override init() {
        super.init()
    }
 
}
