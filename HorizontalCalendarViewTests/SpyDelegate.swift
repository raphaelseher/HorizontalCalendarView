//
//  SpyDelegate.swift
//  HorizontalCalendarView
//
//  Created by Raphael Seher on 20/02/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import UIKit
import XCTest
import HorizontalCalendarView

class SpyDelegate: HorizontalCalendarDelegate {
  // Setting .None is unnecessary, but helps with clarity imho
  var somethingWithDelegateAsyncResult: Date?
  
  // Async test code needs to fulfill the XCTestExpecation used for the test
  // when all the async operations have been completed. For this reason we need
  // to store a reference to the expectation
  var asyncExpectation: XCTestExpectation?
  
  func horizontalCalendarViewDidUpdate(_ calendar: HorizontalCalendarView, date: Date) {
    guard let expectation = asyncExpectation else {
      XCTFail("SpyDelegate was not setup correctly. Missing XCTExpectation reference")
      return
    }
    
    somethingWithDelegateAsyncResult = date
    expectation.fulfill()
  }
}
