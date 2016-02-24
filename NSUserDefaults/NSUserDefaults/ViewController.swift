//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Harry Ng on 24/2/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var inputField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let name = NSUserDefaults.standardUserDefaults().stringForKey("username") {
            nameField.stringValue = name
        } else {
            nameField.stringValue = "New User"
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func changeName(sender: AnyObject) {
        let name = inputField.stringValue
        inputField.stringValue = ""
        
        nameField.stringValue = name
        
        NSUserDefaults.standardUserDefaults().setObject(name, forKey: "username")
    }

}

