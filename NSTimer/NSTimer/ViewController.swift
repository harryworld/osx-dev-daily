//
//  ViewController.swift
//  NSTimer
//
//  Created by Harry Ng on 23/2/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timeLabel: NSTextField!
    
    let countDown: Double = 25 * 60
    var currentSecond: Double = 0
    var timer: NSTimer? {
        didSet {
            oldValue?.invalidate()
        }
    }
    
    lazy var formatter: NSDateComponentsFormatter = {
        let formatter = NSDateComponentsFormatter()
        formatter.allowedUnits = [.Minute, .Second]
        formatter.zeroFormattingBehavior = .Pad
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: true)
        currentSecond = countDown
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer = nil
    }
    
    func update() {
        timeLabel.stringValue = "\(formatter.stringFromTimeInterval(currentSecond)!)"
        currentSecond--
    }

}

