//
//  Playlist.swift
//  OutlineView
//
//  Created by Harry Ng on 15/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class Playlist: NSObject {
    
    dynamic var name: String = "New Playlist"
    dynamic var creator: String = "User"
    
    func isLeaf() -> Bool {
        return true
    }

}
