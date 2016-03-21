//
//  ViewController.swift
//  EventHandling
//
//  Created by Harry Ng on 22/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSGestureRecognizerDelegate {

    @IBOutlet weak var statusLabel: NSTextField!
    var click: NSClickGestureRecognizer?
    var doubleClick: NSClickGestureRecognizer?
    
    var startPoint: NSPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let click = NSClickGestureRecognizer(target: self, action: "click:")
        click.delegate = self
        view.addGestureRecognizer(click)
        self.click = click
        
        let doubleClick = NSClickGestureRecognizer(target: self, action: "doubleClick:")
        doubleClick.numberOfClicksRequired = 2
        view.addGestureRecognizer(doubleClick)
        self.doubleClick = doubleClick
        
        let shiftClick = ShiftClickGestureRecognizer(target: self, action: "shiftClick:")
//        shiftClick.target = self
//        shiftClick.action = "shiftClick:"
        view.addGestureRecognizer(shiftClick)
        
        let rightClick = NSClickGestureRecognizer(target: self, action: "rightClick:")
        click.buttonMask = 0x2 // right mouse click
        view.addGestureRecognizer(rightClick)
        
        let pan = NSPanGestureRecognizer(target: self, action: "panned:")
        view.addGestureRecognizer(pan)
    }
    
    override func viewDidAppear() {
        view.window?.makeFirstResponder(self)
    }
    
    // MARK: Gesture Recognizers
    
    func click(gesture: NSClickGestureRecognizer) {
        print("click")
        statusLabel.stringValue = "Click"
    }
    
    func doubleClick(gesture: NSClickGestureRecognizer) {
        print("doubleClick")
        statusLabel.stringValue = "doubleClick"
    }
    
    func shiftClick(click: ShiftClickGestureRecognizer) {
        print("shiftClick")
        statusLabel.stringValue = "shiftClick"
    }
    
    func rightClick(rightClick: NSClickGestureRecognizer) {
        print("right click")
        statusLabel.stringValue = "Right Click"
    }
    
    func panned(pan: NSPanGestureRecognizer) {
        print("panning")
        statusLabel.stringValue = "Panning"
        
        switch pan.state {
        case .Began:
            startPoint = pan.locationInView(view)
        case .Changed:
            let currentPoint = pan.locationInView(view)
            
            if startPoint.x < currentPoint.x {
                statusLabel.stringValue = "Panning to Right"
            } else {
                statusLabel.stringValue = "Panning to Left"
            }
            
            if let window = view.window {
                var windowFrame = window.frame
                windowFrame.origin.x += currentPoint.x - startPoint.x
                windowFrame.origin.y += currentPoint.y - startPoint.y
                window.setFrame(windowFrame, display: true)
            }
        case .Ended:
            startPoint = nil
            statusLabel.stringValue = "Panning Finished"
        default: break
        }
    }
    
    func gestureRecognizer(gestureRecognizer: NSGestureRecognizer, shouldRequireFailureOfGestureRecognizer otherGestureRecognizer: NSGestureRecognizer) -> Bool {
        if gestureRecognizer == click && otherGestureRecognizer == doubleClick {
            return true
        }
        return false
    }
    
    // MARK: Key Events
    
    override func keyDown(theEvent: NSEvent) {
        statusLabel.stringValue = "No Specific Event"
        
        if (theEvent.modifierFlags.rawValue & NSEventModifierFlags.DeviceIndependentModifierFlagsMask.rawValue) == NSEventModifierFlags.ShiftKeyMask.rawValue {
            if theEvent.keyCode == 49 {
                statusLabel.stringValue = "keyDown: Shift + Space"
            }
        } else if theEvent.keyCode == 49 {
            statusLabel.stringValue = "keyDown: Space"
        }
    }
    
    // MARK: Mouse Events
    
    override func mouseDown(theEvent: NSEvent) {
        print("mouseDown")
        statusLabel.stringValue = "mouseDown \(theEvent.locationInWindow)"
    }
    
    override func mouseUp(theEvent: NSEvent) {
        print("mouseUp")
        statusLabel.stringValue = "mouseUp \(theEvent.locationInWindow)"
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        print("mouseDragged")
        statusLabel.stringValue = "mouseDragged \(theEvent.locationInWindow)"
    }
    
    override func rightMouseDown(theEvent: NSEvent) {
        print("right")
        statusLabel.stringValue = "right mouseDown"
    }

}

