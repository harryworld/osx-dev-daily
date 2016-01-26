//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Harry Ng on 26/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var transformLayer: CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.wantsLayer = true
        transformLayer = CALayer()
        transformLayer.frame = view.bounds.insetBy(dx: 50, dy: 50)
        transformLayer.backgroundColor = NSColor.redColor().CGColor
        view.layer?.addSublayer(transformLayer)
    }

    @IBAction func leftClick(sender: AnyObject) {
        setAngle(45)
    }
    
    @IBAction func rightClick(sender: AnyObject) {
        setAngle(-45)
    }

    func setAngle(degrees: CGFloat) {
        let radians = CGFloat(M_PI) * degrees / 180.0
        var transform = CATransform3DIdentity
        transform.m34 = 1 / -250
        transform = CATransform3DRotate(transform, radians, 0, 1, 0)
        transformLayer.transform = transform
    }

}

