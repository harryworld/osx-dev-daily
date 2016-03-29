//
//  BulletPoint.swift
//  NSTextView
//
//  Created by Harry Ng on 24/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa
import Foundation

enum BulletPoint: String {
    
    case Bullet = "\u{E837} "
    
    static let regex = try! NSRegularExpression(pattern: "(\\uE837)", options: [])
    static let font = NSFont(name: "MaterialIcons-Regular", size: 13)!
    
    // text - paragraph
    static func isChecklist(text: String) -> Bool {
        return text.containsString(BulletPoint.Bullet.rawValue)
    }
    
    var character: String {
        return "\u{E837}"
    }
    
}