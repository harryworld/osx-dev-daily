//
//  RoundedSquareView.swift
//  NSView
//
//  Created by Harry Ng on 25/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class RoundedSquareView: NSView {
    
    var innerFrame: NSRect?
    var roundedPath: NSBezierPath?
    
    override func awakeFromNib() {
        let click = NSClickGestureRecognizer(target: self, action: "click:")
        addGestureRecognizer(click)
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        let backgroundColor = NSColor.lightGrayColor()
        backgroundColor.set()
        NSBezierPath.fillRect(bounds)
        
        NSColor.greenColor().set()
        let path = NSBezierPath()
        path.moveToPoint(NSPoint(x: 0, y: 0))
        path.lineToPoint(NSPoint(x: bounds.width, y: bounds.height))
        path.stroke()
        
        let innerFrame = bounds.insetBy(dx: 10, dy: 10)
        let roundedPath = NSBezierPath(roundedRect: innerFrame, xRadius: 20, yRadius: 20)
        roundedPath.fill()
        
        self.innerFrame = innerFrame
        self.roundedPath = roundedPath
    }
    
    func click(gesture: NSClickGestureRecognizer) {
        Swift.print("click")
        
        if let innerFrame = innerFrame where innerFrame.contains(gesture.locationInView(self)) {
            Swift.print("inside")
        }
        if let roundedPath = roundedPath where roundedPath.containsPoint(gesture.locationInView(self)) {
            Swift.print("inside BeszierPath")
        }
    }
}
