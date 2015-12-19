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
        
        outlineView.deselectRow(0)
        
        outlineView.registerForDraggedTypes([NSPasteboardTypeString])
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
        let p1 = Playlist()
        p1.name = "P1"
        let p2 = Playlist()
        p2.name = "P2"
        dict.setObject([p1, p2], forKey: "children")
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
    
    func outlineView(outlineView: NSOutlineView, isGroupItem item: AnyObject) -> Bool {
        return isHeader(true)
    }
    
    func outlineView(outlineView: NSOutlineView, shouldSelectItem item: AnyObject) -> Bool {
        return !isHeader(item)
    }
    
    func outlineView(outlineView: NSOutlineView, shouldShowOutlineCellForItem item: AnyObject) -> Bool {
        return !isHeader(item)
    }
    
    // MARK: - DataSource
    
    func outlineView(outlineView: NSOutlineView, pasteboardWriterForItem item: AnyObject) -> NSPasteboardWriting? {
        let pbItem = NSPasteboardItem()
        
        if let playlist = ((item as? NSTreeNode)?.representedObject) as? Playlist {
            pbItem.setString(playlist.name, forType: NSPasteboardTypeString)
            return pbItem
        }
        
        return nil
    }
    
    func outlineView(outlineView: NSOutlineView, validateDrop info: NSDraggingInfo, proposedItem item: AnyObject?, proposedChildIndex index: Int) -> NSDragOperation {
        let canDrag = index >= 0 && item != nil
        
        if canDrag {
            return .Move
        } else {
            return .None
        }
    }
    
    func outlineView(outlineView: NSOutlineView, acceptDrop info: NSDraggingInfo, item: AnyObject?, childIndex index: Int) -> Bool {
        let pb = info.draggingPasteboard()
        let name = pb.stringForType(NSPasteboardTypeString)
        
        var sourceNode: NSTreeNode?
        
        if let item = item as? NSTreeNode where item.childNodes != nil {
            for node in item.childNodes! {
                if let playlist = node.representedObject as? Playlist {
                    if playlist.name == name {
                        sourceNode = node
                    }
                }
            }
        }
        if sourceNode == nil {
            return false
        }
        
        let fromIndexPath = treeController.selectionIndexPath
        
        let indexArr: [Int] = [0, index]
        let toIndexPath = NSIndexPath(indexes: indexArr, length: 2)
        treeController.moveNode(sourceNode!, toIndexPath: toIndexPath)
        
        undoManager?.prepareWithInvocationTarget(self).reverse(sourceNode, fromIndexPath: fromIndexPath)
        undoManager?.setActionName("Move")
        
        return true
    }
    
    func reverse(sourceNode: NSTreeNode?, fromIndexPath: NSIndexPath?) {
        treeController.moveNode(sourceNode!, toIndexPath: fromIndexPath!)
    }
}

