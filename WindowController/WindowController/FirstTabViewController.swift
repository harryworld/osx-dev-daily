//
//  FirstTabViewController.swift
//  WindowController
//
//  Created by Harry Ng on 2/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class FirstTabViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func dismissTabView(sender: NSButton) {
        parentViewController?.dismissController(sender)
    }
}
