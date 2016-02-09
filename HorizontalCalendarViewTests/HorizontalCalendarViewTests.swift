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
    let calendar = HorizontalCalendarView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
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
  
  
}
