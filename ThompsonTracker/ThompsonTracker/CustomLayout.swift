//
//  CustomLayout.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/21/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

protocol LayoutDelegate {
    // 1
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath,
                        withWidth:CGFloat) -> CGFloat
    // 2
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
}

class CustomLayout: UICollectionViewLayout {
    
    var delegate: LayoutDelegate!
    
    // 2
    var numberOfColumns = 2
    var cellPadding: CGFloat = 6.0
    
    // 3
    private var cache = [UICollectionViewLayoutAttributes]()
    
    // 4
    private var contentHeight: CGFloat  = 0.0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize{
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        // 1
        if cache.isEmpty {
            // 2
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            // 3
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                
                let indexPath = NSIndexPath(item: item, section: 0)
                
                // 4
                //let width = columnWidth - cellPadding * 2
                let height = cellPadding + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                // 5
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                // 6
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column >= (numberOfColumns - 1) ? 0 : ++column
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }

}

prefix operator ++
postfix operator ++

prefix operator --
postfix operator --


// Increment
prefix func ++( x: inout Int) -> Int {
    x += 1
    return x
}

postfix func ++( x: inout Int) -> Int {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout UInt) -> UInt {
    x += 1
    return x
}

postfix func ++( x: inout UInt) -> UInt {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout Int8) -> Int8 {
    x += 1
    return x
}

postfix func ++( x: inout Int8) -> Int8 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout UInt8) -> UInt8 {
    x += 1
    return x
}

postfix func ++( x: inout UInt8) -> UInt8 {
    x += 1
    return (x - 1)
}
prefix func ++( x: inout Int16) -> Int16 {
    x += 1
    return x
}

postfix func ++( x: inout Int16) -> Int16 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout UInt16) -> UInt16 {
    x += 1
    return x
}

postfix func ++( x: inout UInt16) -> UInt16 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout Int32) -> Int32 {
    x += 1
    return x
}

postfix func ++( x: inout Int32) -> Int32 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout UInt32) -> UInt32 {
    x += 1
    return x
}

postfix func ++( x: inout UInt32) -> UInt32 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout Int64) -> Int64 {
    x += 1
    return x
}

postfix func ++( x: inout Int64) -> Int64 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout UInt64) -> UInt64 {
    x += 1
    return x
}

postfix func ++( x: inout UInt64) -> UInt64 {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout Double) -> Double {
    x += 1
    return x
}

postfix func ++( x: inout Double) -> Double {
    x += 1
    return (x - 1)
}

prefix func ++( x: inout Float) -> Float {
    x += 1
    return x
}

postfix func ++( x: inout Float) -> Float {
    x += 1
    return (x - 1)
}



