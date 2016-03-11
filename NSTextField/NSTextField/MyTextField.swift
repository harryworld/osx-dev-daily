//
//  MyTextField.swift
//  NSTextField
//
//  Created by Harry Ng on 11/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

@objc protocol MyTextFieldDelegate {
    func itemDidStartEditing(textField: MyTextField)
    optional func itemDidEndEditing(textField: MyTextField)
}

class MyTextField: NSTextField {
    
    var myDelegate: MyTextFieldDelegate?

    override func becomeFirstResponder() -> Bool {
        Swift.print("becomeFirstResponder")
        
        myDelegate?.itemDidStartEditing(self)
        
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        myDelegate?.itemDidEndEditing?(self)
        
        return super.resignFirstResponder()
    }
    
}
