//
//  CustomScrollView.swift
//  NSCollectionView2015
//
//  Created by Harry Ng on 19/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class CustomScrollView: NSScrollView {

    override func scrollWheel(theEvent: NSEvent) {
        switch theEvent.phase {
        case NSEventPhase.Began:
            Swift.print("Began")
//        case NSEventPhase.Changed:
//            Swift.print("Changed")
        case NSEventPhase.Ended:
            Swift.print("Ended")
        default: break
        }
        
        switch theEvent.momentumPhase {
        case NSEventPhase.Began:
            Swift.print(">>> Began")
        case NSEventPhase.Ended:
            Swift.print(">>> Ended")
        default: break
        }
        
        super.scrollWheel(theEvent)
    }
    
}
