//
//  NSView+Extensions.swift
//  CoreAnimation
//
//  Created by Harry Ng on 26/8/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

extension NSView {
    func move(anchorPoint anchorPoint: CGPoint) {
        var newPoint = CGPointMake(bounds.size.width * anchorPoint.x, bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(bounds.size.width * layer!.anchorPoint.x, bounds.size.height * layer!.anchorPoint.y)

        newPoint = CGPointApplyAffineTransform(newPoint, layer!.affineTransform())
        oldPoint = CGPointApplyAffineTransform(oldPoint, layer!.affineTransform())

        var position = layer!.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer!.position = position
        layer!.anchorPoint = anchorPoint
    }

    var anchorPoint: CGPoint {
        return layer!.anchorPoint
    }
}
