//
//  ViewController.swift
//  NSControl
//
//  Created by Harry Ng on 13/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var countryCodes = ["HK +852", "China +86", "US +1"]

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var genderControl: NSPopUpButton!
    @IBOutlet weak var countryCode: NSComboBox!
    
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
        
        // Country Code
        countryCode.removeAllItems()
        //countryCode.addItemsWithObjectValues([1, "ABC", 3.5])
        countryCode.usesDataSource = true
        countryCode.dataSource = self
        countryCode.setDelegate(self)
        //countryCode.reloadData()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSComboBoxDataSource {
    
    func numberOfItemsInComboBox(aComboBox: NSComboBox) -> Int {
        return countryCodes.count
    }
    
    func comboBox(aComboBox: NSComboBox, objectValueForItemAtIndex index: Int) -> AnyObject {
        return countryCodes[index]
    }
    
}

extension ViewController: NSComboBoxDelegate {
    func comboBoxWillPopUp(notification: NSNotification) {
        print("popup: \(countryCode.indexOfSelectedItem)")
    }
}

