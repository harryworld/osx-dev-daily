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


}

