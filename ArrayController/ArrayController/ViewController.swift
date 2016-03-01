//
//  ViewController.swift
//  ArrayController
//
//  Created by Harry Ng on 7/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var arrayController: NSArrayController!
    
    lazy var predicate: NSPredicate = {
        return NSPredicate(format: "(name contains[cd] $value) OR (bpm == $value.intValue)")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true, selector: "caseInsensitiveCompare:"), NSSortDescriptor(key: "bpm", ascending: true)]
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func changeSearchQuery(sender: NSSearchField) {
        if sender.stringValue.isEmpty {
            arrayController.filterPredicate = nil
        } else {
            //arrayController.filterPredicate = NSPredicate(format: "(name contains[cd] %@) OR (bpm == %@.intValue)", sender.stringValue, sender.stringValue)
            
            let dict = ["value": sender.stringValue]
            arrayController.filterPredicate = predicate.predicateWithSubstitutionVariables(dict)
        }
    }

}

