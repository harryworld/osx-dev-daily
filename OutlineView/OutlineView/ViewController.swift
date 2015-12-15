//
//  ViewController.swift
//  OutlineView
//
//  Created by Harry Ng on 15/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate {

    @IBOutlet var treeController: NSTreeController!
    @IBOutlet weak var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addData()
        
        outlineView.expandItem(nil, expandChildren: true)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func addData() {
        let root = [
            "name": "Library",
            "isLeaf": false
        ]
        let dict: NSMutableDictionary = NSMutableDictionary(dictionary: root)
        dict.setObject([Playlist(), Playlist()], forKey: "children")
        treeController.addObject(dict)
    }
    
    // MARK: - Hellpers
    
    func isHeader(item: AnyObject) -> Bool {
        if let item = item as? NSTreeNode {
            return !(item.representedObject is Playlist)
        } else {
            return !(item is Playlist)
        }
    }

    // MARK: - Delegate
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        if isHeader(item) {
            return outlineView.makeViewWithIdentifier("HeaderCell", owner: self)
        } else {
            return outlineView.makeViewWithIdentifier("DataCell", owner: self)
        }
    }
}

