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
    }
    
    override func viewDidAppear() {
        outlineView.expandItem(nil, expandChildren: true)
    }
    
    func isHeader(item: AnyObject) -> Bool {
        return (item as? String) == "Labels"
    }

}

extension ViewController {
    
    @IBAction func addToTop(sender: AnyObject) {
        strings.insert("C", atIndex: 0)
        if let rootItem = outlineView.itemAtRow(0) {
            outlineView.insertItemsAtIndexes(NSIndexSet(index: 0), inParent: rootItem, withAnimation: [.SlideRight])
        }
    }
    
    @IBAction func removeFirst(sender: AnyObject) {
        strings.removeFirst()
        if let rootItem = outlineView.itemAtRow(0) {
            outlineView.removeItemsAtIndexes(NSIndexSet(index: 0), inParent: rootItem, withAnimation: [.SlideLeft])
        }
    }
    
    @IBAction func addToBottom(sender: AnyObject) {
        strings.append("D")
        if let rootItem = outlineView.itemAtRow(0) {
            outlineView.insertItemsAtIndexes(NSIndexSet(index: strings.count - 1), inParent: rootItem, withAnimation: [.SlideRight])
        }
    }
    
    @IBAction func removeLast(sender: AnyObject) {
        strings.removeLast()
        if let rootItem = outlineView.itemAtRow(0) {
            outlineView.removeItemsAtIndexes(NSIndexSet(index: strings.count), inParent: rootItem, withAnimation: [.SlideLeft])
        }
    }
    
    @IBAction func moveFirstToLast(sender: AnyObject) {
        let temp = strings[0]
        strings.removeFirst()
        strings.append(temp)
        if let rootItem = outlineView.itemAtRow(0) {
            outlineView.moveItemAtIndex(0, inParent: rootItem, toIndex: strings.count - 1, inParent: rootItem)
        }
    }
    
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
