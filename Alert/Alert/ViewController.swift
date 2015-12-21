//
//  ViewController.swift
//  Alert
//
//  Created by Harry Ng on 20/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var label: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func showAlert(sender: NSButton) {
        alert()
    }
    
    func alert() {
        let alert = NSAlert()
        alert.messageText = "Alert message."
        alert.informativeText = "Detailed description of alert message"
        alert.addButtonWithTitle("Default")
        alert.addButtonWithTitle("Alternative")
        alert.addButtonWithTitle("Other")
        
        alert.beginSheetModalForWindow(view.window!) { (response) -> Void in
            print("The user selected \(response)")
            switch response {
            case NSAlertFirstButtonReturn:
                print("first button")
                self.label.stringValue = "first button"
            case NSAlertSecondButtonReturn:
                print("second button")
                self.label.stringValue = "second button"
            case NSAlertThirdButtonReturn:
                print("third button")
                self.label.stringValue = "third button"
            default:
                break
            }
        }
    }

}

