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

