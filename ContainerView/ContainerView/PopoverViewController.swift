//
//  PopoverViewController.swift
//  ContainerView
//
//  Created by Harry Ng on 29/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class PopoverViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func click(sender: NSButton) {
        NSNotificationCenter.defaultCenter().postNotificationName(CVNotifications.Click.rawValue, object: self)
    }
}
