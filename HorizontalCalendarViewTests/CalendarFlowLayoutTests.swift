//
//  CalendarFlowLayoutTests.swift
//  HorizontalCalendarView
//
//  Created by Raphael Seher on 20/02/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import XCTest
@testable import HorizontalCalendarView

class CalendarFlowLayoutTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testInit() {
    let layout = CalendarFlowLayout(cellWidth: 80)

    XCTAssertEqual(layout.cellWidth, 80)
    XCTAssertEqual(layout.scrollDirection, UICollectionViewScrollDirection.Horizontal)
  }
  
  //TODO: Better testing if needed
  func testTargetContentOffsetForProposedContentOffset() {
    let calendar = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let layout : CalendarFlowLayout = calendar.collectionView!.collectionViewLayout as! CalendarFlowLayout
    
    let offset = layout.targetContentOffsetForProposedContentOffset(CGPoint(x: 1000, y: 0), withScrollingVelocity: CGPoint(x: 1.3, y: 0))
    
    XCTAssertNotNil(offset)
  }
  
  func testCalculateOffset() {
    let calendar = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let layout : CalendarFlowLayout = calendar.collectionView!.collectionViewLayout as! CalendarFlowLayout
    
    let offset = layout.calculateOffset()
    
    XCTAssert(offset == 10)
  }
}
