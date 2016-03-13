//
//  ViewController.swift
//  NSControl
//
//  Created by Harry Ng on 13/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var genderControl: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // NSTextField
        textField.stringValue = "Harry"
        
        // Gender
        genderControl.removeAllItems()
        genderControl.addItemsWithTitles(["Male", "Female"])
        let selectionIndex = genderControl.indexOfSelectedItem
        print("selected gender index: \(selectionIndex)")
        genderControl.selectItemAtIndex(1)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

