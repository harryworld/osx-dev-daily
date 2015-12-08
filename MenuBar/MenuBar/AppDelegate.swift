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

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "Star")
            button.action = Selector("toggleWeather:")
        }
        
        popover.contentViewController = WeatherViewController.loadFromNib()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func toggleWeather(sender: NSStatusBarButton) {
        if popover.shown {
            popover.performClose(sender)
        } else {
            if let button = statusItem.button {
                popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: .MinY)
            }
        }
    }


}

