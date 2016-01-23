//
//  ViewController.swift
//  EventHandling
//
//  Created by Harry Ng on 22/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var statusLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        view.window?.makeFirstResponder(self)
    }
    
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

