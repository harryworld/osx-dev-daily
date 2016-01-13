//
//  CollectionViewListLayout.swift
//  NSCollectionView2015
//
//  Created by Harry Ng on 13/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class CollectionViewListLayout: NSCollectionViewLayout {
    
    var itemHeight: CGFloat = 50
    
    override var collectionViewContentSize: NSSize {
        get {
            let count = collectionView?.numberOfItemsInSection(0)
            if count == 0 {
                return NSZeroSize
            }
            
            var size = collectionView!.superview!.bounds.size
            size.height = itemHeight * CGFloat(count!)
            
            return size
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        let count = collectionView?.numberOfItemsInSection(0) as Int!
        var attributes = [NSCollectionViewLayoutAttributes]()
        
        for index in 0...(count - 1) {
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            if let itemAttributes = layoutAttributesForItemAtIndexPath(indexPath) {
                attributes.append(itemAttributes)
            }
        }
        
        return attributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> NSCollectionViewLayoutAttributes? {
        let count = collectionView?.numberOfItemsInSection(0)
        if (count == 0) {
            return nil
        }
        
        let frame = NSRect(x: 0, y: itemHeight * CGFloat(indexPath.item), width: collectionViewContentSize.width, height: itemHeight)
        
        let itemAttributes = NSCollectionViewLayoutAttributes(forItemWithIndexPath: indexPath)
        itemAttributes.frame = frame
        
        return itemAttributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: NSRect) -> Bool {
        return true
    }

}
