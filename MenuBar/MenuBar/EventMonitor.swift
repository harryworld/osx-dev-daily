//
//  EventMonitor.swift
//  MenuBar
//
//  Created by Harry Ng on 10/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: AnyObject?
    private var mask: NSEventMask
    private var handler: NSEvent? -> ()
    
    init(mask: NSEventMask, handler: NSEvent? -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEventsMatchingMask(mask, handler: handler)
    }
    
    func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
