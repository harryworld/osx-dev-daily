//
//  ViewController.swift
//  NSFont
//
//  Created by Harry Ng on 28/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let font = NSFont.systemFontOfSize(22)
        print("\(font.capHeight)")
        
        let textField = NSTextField(frame: NSRect(x: 100, y: 100, width: 200, height: ceil(font.capHeight) + 20))
        textField.font = font
        textField.editable = false
        textField.alignment = .Center
        textField.stringValue = "OSX Dev Daily"
        view.addSubview(textField)
        
        let attrStr = NSMutableAttributedString(string: "OSX Dev Daily")
        attrStr.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSRange(8...12))
        attrStr.addAttribute(NSFontAttributeName, value: NSFont.boldSystemFontOfSize(22), range: NSRange(0...2))
        attrStr.addAttribute(NSForegroundColorAttributeName, value: NSColor.redColor(), range: NSRange(0...2))
        textField.attributedStringValue = attrStr
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

