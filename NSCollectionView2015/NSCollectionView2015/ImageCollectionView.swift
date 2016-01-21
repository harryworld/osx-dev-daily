//
//  ImageCollectionView.swift
//  NSCollectionView2015
//
//  Created by Harry Ng on 21/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ImageCollectionView: NSView {
    
    var mouseInside: Bool = false {
        didSet {
            needsDisplay = true
        }
    }
    
    override func awakeFromNib() {
        wantsLayer = true
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        
        layer?.backgroundColor = NSColor.redColor().CGColor
        
        if mouseInside {
            layer?.backgroundColor = NSColor.yellowColor().CGColor
        }
    }
    
}
