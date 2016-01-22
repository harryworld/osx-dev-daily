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

}

