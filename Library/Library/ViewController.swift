//
//  ViewController.swift
//  Library
//
//  Created by Harry Ng on 29/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa
import Alamofire

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Alamofire.request(.GET, "https://httpbin.org/get")
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

