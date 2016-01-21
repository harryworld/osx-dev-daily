//
//  CustomScrollView.swift
//  NSCollectionView2015
//
//  Created by Harry Ng on 19/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class CustomScrollView: NSScrollView {
    
    override func awakeFromNib() {
        let area = NSTrackingArea(rect: bounds, options: [.InVisibleRect, .ActiveAlways, .MouseMoved], owner: self, userInfo: nil)
        addTrackingArea(area)
    }

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
    
    override func mouseMoved(theEvent: NSEvent) {
        var pointInView = convertPoint(theEvent.locationInWindow, fromView: nil)
        pointInView.y += documentVisibleRect.origin.y
        
        if let collectionView = documentView as? NSCollectionView {
            
            for item in collectionView.visibleItems() {
                (item as? ImageCollectionViewItem)?.setBackground(false)
            }
            
            if let indexPath = collectionView.indexPathForItemAtPoint(pointInView) {
                if let item = collectionView.itemAtIndexPath(indexPath) as? ImageCollectionViewItem {
                    item.setBackground(true)
                }
            }
        }
    }
    
}
