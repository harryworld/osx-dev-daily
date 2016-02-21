//
//  ViewController.swift
//  OutlineViewSelection
//
//  Created by Harry Ng on 21/2/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var strings = ["A", "B"]
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        outlineView.setDelegate(self)
        outlineView.setDataSource(self)
        
        outlineView.expandItem(nil, expandChildren: true)
    }
    
    func isHeader(item: AnyObject) -> Bool {
        return (item as? String) == "Labels"
    }

}

extension ViewController {
    
}

extension ViewController: NSOutlineViewDataSource {
    
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
        if item == nil {
            return 1
        } else {
            return strings.count
        }
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        return isHeader(item)
    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
        if item == nil {
            return "Labels"
        } else {
            return strings[index]
        }
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject? {
        return item
    }
    
}

extension ViewController: NSOutlineViewDelegate {
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        
        if isHeader(item) {
            return outlineView.makeViewWithIdentifier("HeaderCell", owner: self)
        } else {
            let view = outlineView.makeViewWithIdentifier("DataCell", owner: self) as? NSTableCellView
            
            if let item = item as? String {
                view?.textField?.stringValue = item
            }
            
            return view
        }
    }
    
    func outlineView(outlineView: NSOutlineView, shouldShowOutlineCellForItem item: AnyObject) -> Bool {
        return false
    }
    
    func outlineView(outlineView: NSOutlineView, shouldSelectItem item: AnyObject) -> Bool {
        return !isHeader(item)
    }
    
}
