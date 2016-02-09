//
//  HorizontalCalendarTests.swift
//  HorizontalCalendarView
//
//  Created by Raphael Seher on 26/01/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import XCTest
@testable import HorizontalCalendarView

class HorizontalCalendarTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testThatCurrentYearIs2015() {
    let cal : HorizontalCalendar = HorizontalCalendar()
    XCTAssertEqual(cal.currentYear(), 2016)
  }
  
  func testThatFirstDayInYearReturnsFirstDay() {
    let cal : HorizontalCalendar = HorizontalCalendar()
    let dateComponents : NSDateComponents = NSDateComponents()
    dateComponents.day = 1
    dateComponents.month = 1
    dateComponents.year = 2015
    let checkDate = cal.calendar.dateFromComponents(dateComponents)
    
    let firstDayInYear = cal.firstDayInYear(2015)
    
    XCTAssertEqual(firstDayInYear, checkDate)
  }
  
  func testThatDatesForYearReturns365Dates() {
    let cal : HorizontalCalendar = HorizontalCalendar()
    let dates = cal.datesForYear(2015)
    XCTAssertEqual(dates.count, 365)
  }
  
  func testThatDatesForYearReturns366DatesFor2016() {
    let cal : HorizontalCalendar = HorizontalCalendar()
    let dates = cal.datesForYear(2016)
    XCTAssertEqual(dates.count, 366)
  }
  
  func testThatTruncateDateToYearReturnsFormattedDate() {
    let cal : HorizontalCalendar = HorizontalCalendar()
    let dateComponents = cal.calendar.components([.Year, .Month, .Day], fromDate: NSDate())
    let checkDate = cal.calendar.dateFromComponents(dateComponents)
    
    XCTAssertEqual(checkDate, cal.truncateDateToYearMonthDay(NSDate()))
  }
}
