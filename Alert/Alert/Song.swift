//
//  Song.swift
//  Alert
//
//  Created by Harry Ng on 23/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Foundation

class Song: NSObject {
    
    var title: String
    var author: String
    var duration: Double
    
    init(title: String, author: String, duration: Double) {
        self.title = title
        self.author = author
        self.duration = duration
    }
    
}