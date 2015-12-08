//
//  WeatherViewController.swift
//  MenuBar
//
//  Created by Harry Ng on 8/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class WeatherViewController: NSViewController {
    
    class func loadFromNib() -> WeatherViewController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateControllerWithIdentifier("WeatherViewController") as! WeatherViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
