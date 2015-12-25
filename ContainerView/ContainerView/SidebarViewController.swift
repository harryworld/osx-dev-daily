//
//  SidebarViewController.swift
//  ContainerView
//
//  Created by Harry Ng on 24/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class SidebarViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print("viewDidLoad")
        print("view: \(view.window)")
    }
    
    override func viewWillAppear() {
        print("viewWillAppear")
        print("view: \(view.window?.title)")
        view.window?.title = "ContainerView"
    }
    
    override func viewDidAppear() {
        print("viewDidAppear")
    }
    
    override func viewWillLayout() {
        print("viewWillLayout")
    }
    
    override func viewDidLayout() {
        print("viewDidLayout")
    }
    
    override func viewWillDisappear() {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear() {
        print("viewDidDisappear")
    }
    
    @IBAction func click(sender: NSButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("click", object: self)
    }
}
