//
//  MyTextView.swift
//  NSTextView
//
//  Created by Harry Ng on 23/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class MyTextView: NSTextView {

    override func insertTab(sender: AnyObject?) {
        Swift.print("insertTab")
        
        //super.insertTab(sender)
        Swift.print(selectedRange())
        if let (text, range) = paragraphAndRange(selectedRange()) {
            
            if !BulletPoint.isChecklist(text) {
                let startRange = NSMakeRange(string!.startIndex.distanceTo(range.startIndex), 0)
                insertText("- ", replacementRange: startRange)
            }
        }
        
        
    }
    
    override func insertBacktab(sender: AnyObject?) {
        Swift.print("insertBacktab")
        
        if let (_, range) = paragraphAndRange(selectedRange()) {
            let loc = string!.startIndex.distanceTo(range.startIndex)
            let bulletRange = NSMakeRange(loc, 2)
            
            replaceCharactersInRange(bulletRange, withString: "")
        }
    }
    
    override func insertNewline(sender: AnyObject?) {
        if let (text, _) = paragraphAndRange(selectedRange()) {
            if BulletPoint.isChecklist(text) {
                insertText("\n- ", replacementRange: selectedRange())
            } else {
                super.insertNewline(sender)
            }
        }
    }
    
    override func deleteBackward(sender: AnyObject?) {
        if let (text, range) = paragraphAndRange(selectedRange()) {
            if BulletPoint.isChecklist(text) {
                let loc = textStorage!.string.startIndex.distanceTo(range.startIndex)
                
                if loc == selectedRange().location - 2 {
                    let deleteRange = NSMakeRange(loc, 2)
                    textStorage?.replaceCharactersInRange(deleteRange, withString: "")
                    return
                }
            }
        }
        
        super.deleteBackward(sender)
    }
    
    // MARK: - Helpers
    
    private func paragraphAndRange(range: NSRange) -> (String, Range<String.Index>)? {
        if let str = string {
            let r = range.stringRangeForText(str)
            let paragraphRange = str.paragraphRangeForRange(r)
            
            let paragraphString = str.substringWithRange(paragraphRange)
            
            return (paragraphString, paragraphRange)
        } else {
            return nil
        }
    }
    
}

extension MyTextView: NSTextViewDelegate {
    
    func textView(textView: NSTextView, doCommandBySelector commandSelector: Selector) -> Bool {
        Swift.print(commandSelector)
        
        return false
    }
    
    func textView(textView: NSTextView, shouldChangeTextInRange affectedCharRange: NSRange, replacementString: String?) -> Bool {
        Swift.print(affectedCharRange)
        Swift.print(replacementString)
        
        if let (_, range) = paragraphAndRange(selectedRange()) {
            let startRange = NSMakeRange(string!.startIndex.distanceTo(range.startIndex), 0)
            if affectedCharRange.location != startRange.location {
            
                if let str = replacementString where str.containsString("-") {
                    return false
                }
            }
        }
        
        return true
    }
    
    func textViewDidChangeSelection(notification: NSNotification) {
        Swift.print("textViewDidChangeSelection")
    }
    
    func textViewDidChangeTypingAttributes(notification: NSNotification) {
        Swift.print(textStorage)
    }
    
}

extension NSRange {
    func stringRangeForText(string: String) -> Range<String.Index> {
        let start = string.startIndex.advancedBy(self.location)
        let end = start.advancedBy(self.length)
        return start..<end
    }
}
