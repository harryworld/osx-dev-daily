//
//  WindowController.swift
//  WindowController
//
//  Created by Harry Ng on 4/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.titleVisibility = .Hidden
        window?.titlebarAppearsTransparent = true
    }
    
}
