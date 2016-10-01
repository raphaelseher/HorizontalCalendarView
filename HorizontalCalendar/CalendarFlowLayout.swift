//
//  CalendarFlowLayout.swift
//  HorizontalCalendar
//
//  Created by Raphael Seher on 29/12/15.
//  Copyright © 2015 Raphael Seher. All rights reserved.
//

import UIKit

class CalendarFlowLayout: UICollectionViewFlowLayout {

  var cellWidth : CGFloat = 0.0
  
  convenience init(cellWidth : CGFloat) {
    self.init()
    self.cellWidth = cellWidth
    self.scrollDirection = .horizontal
  }
  
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    var offsetAdjustment : CGFloat = CGFloat(MAXFLOAT)
    let horizontalOffset = proposedContentOffset.x + calculateOffset()
    let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: (collectionView?.bounds.size.width)!, height: (collectionView?.bounds.height)!)
    let array = super.layoutAttributesForElements(in: targetRect)
    
    for layoutAttributes in array! {
      let itemOffset = layoutAttributes.frame.origin.x
      if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
        offsetAdjustment = itemOffset - horizontalOffset
      }
    }
    
    return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
  }

  func calculateOffset() -> CGFloat {
    let sizeBetweenBoundAndCenteredView = (self.collectionView?.bounds.size.width)!/2 - cellWidth/2
    return sizeBetweenBoundAndCenteredView
  }
}
