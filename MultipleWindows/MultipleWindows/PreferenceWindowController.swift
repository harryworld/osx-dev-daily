//
//  PreferenceWindowController.swift
//  MultipleWindows
//
//  Created by Harry Ng on 25/2/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class PreferenceWindowController: NSWindowController {

    // ========================
    // MARK: - Static functions
    // ========================
    
    class func loadFromNib() -> PreferenceWindowController {
        let vc = NSStoryboard(name: "Preferences", bundle: nil).instantiateControllerWithIdentifier("PreferenceWindowController") as! PreferenceWindowController
        return vc
    }

    // =========================
    // MARK: - Lifecycle methods
    // =========================

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
