//
//  BulletPoint.swift
//  NSTextView
//
//  Created by Harry Ng on 24/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Foundation

enum BulletPoint {
    
    // text - paragraph
    static func isChecklist(text: String) -> Bool {
        return text.containsString("- ")
    }
    
}