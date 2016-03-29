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
                insertText(BulletPoint.Bullet.rawValue, replacementRange: startRange)
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
                insertText("\n\(BulletPoint.Bullet.rawValue)", replacementRange: selectedRange())
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
    
    // MARK: - Mouse events
    
    override func mouseMoved(theEvent: NSEvent) {
        let fulltextRange = NSMakeRange(0, textStorage!.length)
        var lineGlyphRange = NSMakeRange(0, textStorage!.length)
        layoutManager?.removeTemporaryAttribute(NSBackgroundColorAttributeName, forCharacterRange: fulltextRange)
        
        let point = convertPoint(theEvent.locationInWindow, fromView: nil)
        
        if let layoutManager = layoutManager, textContainer = textContainer {
            let glyphIndex = layoutManager.glyphIndexForPoint(point, inTextContainer: textContainer)
            
            let glyphRect = layoutManager.boundingRectForGlyphRange(NSMakeRange(glyphIndex, 1), inTextContainer: textContainer)
            
            if NSPointInRect(point, glyphRect) {
                let charIndex = layoutManager.characterIndexForGlyphAtIndex(glyphIndex)
                
                layoutManager.lineFragmentRectForGlyphAtIndex(glyphIndex, effectiveRange: &lineGlyphRange)
                let lineRange = layoutManager.characterRangeForGlyphRange(lineGlyphRange, actualGlyphRange: nil)
                
                let wordRange = selectionRangeForProposedRange(NSMakeRange(charIndex, 0), granularity: .SelectByWord)
                
                layoutManager.addTemporaryAttributes([NSBackgroundColorAttributeName: NSColor.yellowColor()], forCharacterRange: lineRange)
                layoutManager.addTemporaryAttributes([NSBackgroundColorAttributeName: NSColor.greenColor()], forCharacterRange: wordRange)
                layoutManager.addTemporaryAttributes([NSBackgroundColorAttributeName: NSColor.redColor()], forCharacterRange: NSMakeRange(charIndex, 1))
            }
        }
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
            
                if let str = replacementString where str.containsString(BulletPoint.Bullet.character) {
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

extension MyTextView: NSTextStorageDelegate {
    
    func textStorage(textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorageEditActions, range editedRange: NSRange, changeInLength delta: Int) {
        
        let paragraphRange = NSString(string: string!).paragraphRangeForRange(editedRange)
        let materialIconsAttributes = [NSFontAttributeName: BulletPoint.font]
        
        textStorage.addAttributes([NSFontAttributeName: NSFont.systemFontOfSize(13.0)], range: paragraphRange)
        
        BulletPoint.regex.enumerateMatchesInString(string!, options: [], range: paragraphRange) { (match, flags, stop) in
            
            if let matchRange = match?.rangeAtIndex(1) {
                textStorage.addAttributes(materialIconsAttributes, range: matchRange)
            }
        }
    }
    
}

extension NSRange {
    func stringRangeForText(string: String) -> Range<String.Index> {
        let start = string.startIndex.advancedBy(self.location)
        let end = start.advancedBy(self.length)
        return start..<end
    }
}
