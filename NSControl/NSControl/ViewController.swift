//
//  ViewController.swift
//  NSControl
//
//  Created by Harry Ng on 13/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var countryCodes = ["HK +852", "China +86", "US +1"]

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var genderControl: NSPopUpButton!
    @IBOutlet weak var countryCode: NSComboBox!
    @IBOutlet var bioTextView: NSTextView!
    @IBOutlet weak var salarySlider: NSSlider!
    @IBOutlet weak var salaryLabel: NSTextField!
    @IBOutlet weak var birthday: NSDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // NSTextField
        textField.stringValue = "Harry"
        
        // Gender
        genderControl.removeAllItems()
        genderControl.addItemsWithTitles(["Male", "Female"])
        let selectionIndex = genderControl.indexOfSelectedItem
        print("selected gender index: \(selectionIndex)")
        genderControl.selectItemAtIndex(1)
        
        // Country Code
        countryCode.removeAllItems()
        //countryCode.addItemsWithObjectValues([1, "ABC", 3.5])
        countryCode.usesDataSource = true
        countryCode.dataSource = self
        countryCode.setDelegate(self)
        //countryCode.reloadData()
        
        // Bio
        bioTextView.backgroundColor = NSColor.lightGrayColor()
        bioTextView.textColor = NSColor.blueColor()
        bioTextView.string = "Red Green Blue"
        let myAtrributedString = NSMutableAttributedString(string: "Red Green Blue")
        myAtrributedString.addAttribute(NSForegroundColorAttributeName, value: NSColor.redColor(), range: NSMakeRange(0, 3))
        myAtrributedString.addAttribute(NSForegroundColorAttributeName, value: NSColor.greenColor(), range: NSMakeRange(4, 5))
        bioTextView.textStorage?.setAttributedString(myAtrributedString)
        bioTextView.delegate = self
        
        // Salary
        salarySlider.minValue = 1
        salarySlider.maxValue = 10
        salarySlider.integerValue = 3
        
        // Birthday
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let minDate = formatter.dateFromString("2000-01-01")
        birthday.minDate = minDate
        let maxDate = formatter.dateFromString("2020-12-31")
        birthday.maxDate = maxDate
        birthday.dateValue = NSDate()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func updateSalary(sender: NSSlider) {
        print("Salary: \(sender.integerValue)")
        let currencyStyle = NSNumberFormatter()
        currencyStyle.formatterBehavior = .Behavior10_4
        currencyStyle.numberStyle = .DecimalStyle
        let salary = sender.integerValue * 10000
        salaryLabel.stringValue = "[\(currencyStyle.stringFromNumber(salary)!)]"
    }

    @IBAction func choosePlaceOfBirth(sender: NSButton) {
        print("Place of Birth: \(sender.title)")
    }
}

extension ViewController: NSComboBoxDataSource {
    
    func numberOfItemsInComboBox(aComboBox: NSComboBox) -> Int {
        return countryCodes.count
    }
    
    func comboBox(aComboBox: NSComboBox, objectValueForItemAtIndex index: Int) -> AnyObject {
        return countryCodes[index]
    }
    
}

extension ViewController: NSComboBoxDelegate {
    func comboBoxWillPopUp(notification: NSNotification) {
        print("popup: \(countryCode.indexOfSelectedItem)")
    }
}

extension ViewController: NSTextViewDelegate {
    func textViewDidChangeSelection(notification: NSNotification) {
        print("textView: \(bioTextView.attributedString())")
    }
}
