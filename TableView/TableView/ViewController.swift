//
//  ViewController.swift
//  TableView
//
//  Created by Harry Ng on 3/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTextFieldDelegate {
    
    var strings = ["apple", "banana", "orange", "watermelon"]
    var backupStrings: [String]!
    var isSearching = false {
        didSet {
            if isSearching != oldValue {
                if isSearching {
                    backupStrings = strings
                } else {
                    strings = backupStrings
                }
            }
        }
    }

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func addFruit(sender: AnyObject?) {
        let string = textField.stringValue
        strings.append(string)
        textField.stringValue = ""
        tableView.reloadData()
    }
    
    @IBAction func searchWith(sender: NSSearchField) {
        if sender.stringValue.isEmpty {
            print("isEmpty")
            isSearching = false
        } else {
            print(sender.stringValue)
            isSearching = true
            
            strings = backupStrings.filter { s in
                return s.lowercaseString.containsString(sender.stringValue.lowercaseString)
            }
        }
        tableView.reloadData()
    }
    
    // MARK: DataSource
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return strings.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        return strings[row]
    }
    
    // MARK: Delegate
    
    override func controlTextDidEndEditing(obj: NSNotification) {
        addFruit(nil)
    }

}

