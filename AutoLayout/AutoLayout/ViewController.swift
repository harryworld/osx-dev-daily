//
//  ViewController.swift
//  AutoLayout
//
//  Created by Harry Ng on 3/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {

    @IBOutlet weak var rightView: NSView!
    @IBOutlet weak var leftView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rightView.wantsLayer = true
        rightView.layer?.backgroundColor = NSColor.greenColor().CGColor
        
        leftView.wantsLayer = true
        leftView.layer?.backgroundColor = NSColor.redColor().CGColor
        
        //leftView.snp_makeConstraints { make in
            //make.top.equalTo(view)
            //make.left.equalTo(view)
            //make.bottom.equalTo(view)
        //}
        
        //let bottomLeftConstraint = NSLayoutConstraint(item: leftView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        //view.addConstraint(bottomLeftConstraint)
        
        let centerView = NSView(frame: NSRect(x: 100, y: 0, width: 65, height: 100))
        centerView.wantsLayer = true
        centerView.layer?.backgroundColor = NSColor.blueColor().CGColor
        view.addSubview(centerView)
        
        centerView.snp_makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.width.equalTo(60)
            make.centerX.equalTo(view)
        }
        
        //let topCenterConstraint = NSLayoutConstraint(item: centerView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        //view.addConstraint(topCenterConstraint)
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

