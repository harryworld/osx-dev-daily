//
//  ViewController.swift
//  Alert
//
//  Created by Harry Ng on 20/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        alert()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func alert() {
        let alert = NSAlert()
        alert.messageText = "Alert message."
        alert.informativeText = "Detailed description of alert message"
        alert.addButtonWithTitle("Default")
        alert.addButtonWithTitle("Alternative")
        alert.addButtonWithTitle("Other")
        let result = alert.runModal()
        
        switch result {
        case NSAlertFirstButtonReturn:
            print("first button")
        case NSAlertSecondButtonReturn:
            print("second button")
        case NSAlertThirdButtonReturn:
            print("third button")
        default:
            break
        }
    }

}

