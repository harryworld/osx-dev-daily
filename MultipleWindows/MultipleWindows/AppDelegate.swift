//
//  AppDelegate.swift
//  MultipleWindows
//
//  Created by Harry Ng on 25/2/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var controller: NSWindowController?
    var windowController: PreferenceWindowController?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        print("appDelegate")
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateControllerWithIdentifier("MainWindow") as? NSWindowController
            controller?.showWindow(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func showPreference(sender: AnyObject) {
        if windowController == nil {
            windowController = PreferenceWindowController.loadFromNib()
        }
        windowController?.showWindow(self)
    }

}

