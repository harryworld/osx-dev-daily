//
//  ImageCollectionViewItem.swift
//  NSCollectionView2015
//
//  Created by Harry Ng on 10/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ImageCollectionViewItem: NSCollectionViewItem {
    
    override var selected: Bool {
        didSet {
            super.selected = selected
            updateColor()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.redColor().CGColor
    }
    
    func updateColor() {
        if selected {
            switch highlightState {
            case .None, .ForDeselection:
                view.layer?.backgroundColor = NSColor.redColor().CGColor
            case .ForSelection:
                view.layer?.backgroundColor = NSColor.greenColor().CGColor
            default: break
            }
        } else {
            view.layer?.backgroundColor = NSColor.redColor().CGColor
        }
    }
    
}
