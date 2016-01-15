//
//  ViewController.swift
//  NSCollectionView2015
//
//  Created by Harry Ng on 10/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.backgroundColors = [NSColor.grayColor()]
        
//        let layout = NSCollectionViewGridLayout()
//        layout.maximumNumberOfColumns = 1
//        layout.maximumNumberOfRows = 5
//        layout.minimumItemSize = NSSize(width: 0, height: 50)
        
//        collectionView.collectionViewLayout = layout
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSCollectionViewDataSource {
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItemWithIdentifier("ImageCollectionViewItem", forIndexPath: indexPath)
        return item
    }
    
    func collectionView(collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> NSView {
        var nibName: String?
        
        if kind == NSCollectionElementKindSectionHeader {
            nibName = "Header"
        } else if kind == NSCollectionElementKindSectionFooter {
            nibName = "Footer"
        }
        
        let view = collectionView.makeSupplementaryViewOfKind(kind, withIdentifier: nibName!, forIndexPath: indexPath)
        
        if let view = view as? HeaderView {
            view.titleTextField?.stringValue = "Custom Header"
        } else if let view = view as? FooterView {
            view.titleTextField?.stringValue = "Custom Footer"
        }
        return view
    }
}

extension ViewController: NSCollectionViewDelegate {
    func collectionView(collectionView: NSCollectionView, didSelectItemsAtIndexPaths indexPaths: Set<NSIndexPath>) {
        print(indexPaths)
    }
}

extension ViewController: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
}
