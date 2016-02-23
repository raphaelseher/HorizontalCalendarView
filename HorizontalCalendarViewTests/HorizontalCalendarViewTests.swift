//
//  HorizontalCalendarViewTests.swift
//  HorizontalCalendarViewTests
//
//  Created by Raphael Seher on 26/01/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import XCTest
@testable import HorizontalCalendarView

class HorizontalCalendarViewTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testInitWithFrame() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    
    XCTAssertNotNil(calendar.collectionView)
    XCTAssertEqual(calendar.startingYear, 2016)
  }
  
  func testInitWithFrameCellWithNib() {
    let calendar = HorizontalCalendarView.init(frame: CGRect.zero, cellWidth: 100.0, cellNib: UINib.init())
    
    XCTAssertNotNil(calendar.collectionView)
    XCTAssertEqual(calendar.startingYear, 2016)
  }
  
  func testInitWithFrameCellWithClass() {
    let calendar = HorizontalCalendarView.init(frame: CGRect.zero, cellWidth: 100.0, cellClass: CalendarCollectionViewCell.self)
    
    XCTAssertNotNil(calendar.collectionView)
    XCTAssertEqual(calendar.startingYear, 2016)
  }
  
  func testInitWithCoder() {
    let coder = NSKeyedUnarchiver(forReadingWithData: NSMutableData())
    let calendar = HorizontalCalendarView.init(coder: coder)
    
    XCTAssertNotNil(calendar)

    if let calendar = calendar {
      XCTAssertNotNil(calendar.collectionView)
      XCTAssertEqual(calendar.startingYear, 2016)
    }
  }
  
  func testAddDatesFromPreviousYear() {
    let calendar = HorizontalCalendarView.init(frame: CGRect.zero)
    calendar.activeIndexPath = NSIndexPath(forItem: 1, inSection: 1)
    calendar.addDatesFromYear(2015)
    
    XCTAssertEqual(calendar.displayedYears.count, 2)
    XCTAssertEqual(calendar.dates.count, 731)
  }
  
  func testAddDatesFromNextYear() {
    let calendar = HorizontalCalendarView.init(frame: CGRect.zero)
    calendar.activeIndexPath = NSIndexPath(forItem: 1, inSection: 1)
    calendar.addDatesFromYear(2017)
    
    XCTAssertEqual(calendar.displayedYears.count, 2)
    XCTAssertEqual(calendar.dates.count, 731)
  }
  
  func testAddDatesFromCurrentYear() {
    let calendar = HorizontalCalendarView.init(frame: CGRect.zero)
    calendar.activeIndexPath = NSIndexPath(forItem: 1, inSection: 1)
    calendar.addDatesFromYear(2016)
    
    XCTAssertEqual(calendar.displayedYears.count, 1)
    XCTAssertEqual(calendar.dates.count, 366)
  }
  
  func testUpdateActiveIndexPath() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    let indexPath = NSIndexPath(index: 0)
    
    calendar.updateActiveIndexPath(indexPath)
    
    XCTAssertEqual(calendar.activeIndexPath, indexPath)
  }
  
  func testCheckForEndOfDatesBefore() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    let scrollView = UIScrollView()
    scrollView.contentOffset = CGPoint(x: 0,y: 0)
    calendar.activeIndexPath = NSIndexPath(forRow: 1, inSection: 0)
    
    calendar.checkForEndOfDates(scrollView)
    
    XCTAssertTrue(calendar.displayedYears.count == 2)
    XCTAssertTrue(calendar.displayedYears.last == 2015)
  }
  
  func testCheckForEndOfDatesAfter() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    let scrollView = UIScrollView()
    scrollView.contentOffset = CGPoint(x: 30000,y: 0)
    calendar.activeIndexPath = NSIndexPath(forRow: 365, inSection: 0)
    
    calendar.checkForEndOfDates(scrollView)
    
    XCTAssertTrue(calendar.displayedYears.count == 2)
    XCTAssertTrue(calendar.displayedYears.last == 2017)
  }
  
  func testLineSpacing() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    
    let spacing = calendar.collectionView(calendar.collectionView!, layout: (calendar.collectionView?.collectionViewLayout)!, minimumLineSpacingForSectionAtIndex: 1)
    
    XCTAssertTrue(spacing == 0.0)
  }
  
  func testInterItemSpacing() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    
    let spacing = calendar.collectionView(calendar.collectionView!, layout: calendar.collectionView!.collectionViewLayout, minimumInteritemSpacingForSectionAtIndex: 1)
    
    XCTAssertTrue(spacing == 0.0)
  }
  
  func testCellForItemAtIndexPath() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)

    let cell : CalendarCollectionViewCell = calendar.collectionView(calendar.collectionView!, cellForItemAtIndexPath: indexPath) as! CalendarCollectionViewCell
    
    XCTAssertNotNil(cell)
    XCTAssertTrue(cell.dayLabel.text == "01")
    XCTAssertTrue(cell.monthLabel.text == "Jan")
  }
  
  func testCellForItemAtIndexPathActive() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    calendar.activeIndexPath = indexPath
    
    let cell : CalendarCollectionViewCell = calendar.collectionView(calendar.collectionView!, cellForItemAtIndexPath: indexPath) as! CalendarCollectionViewCell
    
    XCTAssertNotNil(cell)
    XCTAssertTrue(cell.dayLabel.text == "01")
    XCTAssertTrue(cell.monthLabel.text == "Jan")
    XCTAssertTrue(cell.reddotImageView.hidden == false)
  }
  
  func testSizeForItem() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    let size = calendar.collectionView(calendar.collectionView!, layout: calendar.collectionView!.collectionViewLayout, sizeForItemAtIndexPath: indexPath)
    
    XCTAssertEqual(size, CGSize(width: 80.0, height: 0))
  }
  
  func testInsetForSection() {
    let calendar = HorizontalCalendarView.init(frame: CGRectZero)
    
    let insets = calendar.collectionView(calendar.collectionView!, layout: calendar.collectionView!.collectionViewLayout, insetForSectionAtIndex: 0)
    
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
  }
  
  func testUpdateActiveIndexPathWhenScrolling() {
    let calendar = HorizontalCalendarView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let scrollView = UIScrollView()
    scrollView.contentOffset = CGPoint(x: 10, y: 0)
    
    calendar.scrollViewDidScroll(scrollView)
    
    XCTAssertNotNil(calendar.activeIndexPath)
  }
  
  func testThatLoadMoreWhenEndDragging() {
    let calendar = HorizontalCalendarView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let scrollView = UIScrollView()
    scrollView.contentOffset = CGPoint(x: 10, y: 0)
    
    calendar.scrollViewDidScroll(scrollView)
    calendar.scrollViewDidEndDragging(scrollView, willDecelerate: true)

    XCTAssertTrue(calendar.dates.count > 600)
    XCTAssertTrue(calendar.displayedYears.count == 2)
  }
  
  func testThatLoadMoreWhenEndDecelerating() {
    let calendar = HorizontalCalendarView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let scrollView = UIScrollView()
    scrollView.contentOffset = CGPoint(x: 10, y: 0)
    
    calendar.scrollViewDidScroll(scrollView)
    calendar.scrollViewDidEndDecelerating(scrollView)
    
    XCTAssertTrue(calendar.dates.count > 600)
    XCTAssertTrue(calendar.displayedYears.count == 2)
  }
  
}
