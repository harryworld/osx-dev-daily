//
//  ShiftClickGestureRecognizer.swift
//  EventHandling
//
//  Created by Harry Ng on 27/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ShiftClickGestureRecognizer: NSClickGestureRecognizer {
    
    override init(target: AnyObject, action: Selector) {
        super.init(target: target, action: action)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func mouseDown(event: NSEvent) {
        if (event.modifierFlags.rawValue & NSEventModifierFlags.ShiftKeyMask.rawValue) == NSEventModifierFlags.ShiftKeyMask.rawValue {
            super.mouseDown(event)
        }
    }
    
}
