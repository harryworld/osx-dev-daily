//
//  MainViewController.swift
//  ContainerView
//
//  Created by Harry Ng on 24/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var label: NSTextField!
    private var numberOfClicks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print("Main")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "display:", name: CVNotifications.Click.rawValue, object: nil)
    }
    
    func display(notification: NSNotification) {
        if let content = notification.userInfo?[CVNotificationsUserInfo.Content.rawValue] as? String where content != "" {
            label.stringValue = content
        } else {
            numberOfClicks++
            label.stringValue = "Click \(numberOfClicks) times"
        }
    }
    
}
