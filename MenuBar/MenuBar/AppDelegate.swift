//
//  AppDelegate.swift
//  MenuBar
//
//  Created by Harry Ng on 8/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "Star")
            button.action = Selector("toggleWeather:")
        }
        
        popover.contentViewController = WeatherViewController.loadFromNib()
        
        eventMonitor = EventMonitor(mask: [.LeftMouseUpMask, .RightMouseUpMask], handler: { (event) -> () in
            if self.popover.shown {
                self.closePopover(event)
            }
        })
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: .MinY)
        }
        eventMonitor?.start()
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    func toggleWeather(sender: NSStatusBarButton) {
        if popover.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }


}

