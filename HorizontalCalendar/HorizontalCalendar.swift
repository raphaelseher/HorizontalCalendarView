//
//  HorizontalCalendar.swift
//  HorizontalCalendar
//
//  Created by Raphael Seher on 27/12/15.
//  Copyright © 2015 Raphael Seher. All rights reserved.
//

import UIKit

public class HorizontalCalendar: NSObject {
  let calendar : NSCalendar!
  
  override init() {
    calendar = NSCalendar.currentCalendar()
  }
  
  func currentYear() -> Int {
    let components = calendar.components(NSCalendarUnit.Year, fromDate: NSDate())
    return components.year
  }

  func firstDayInYear(year: Int) -> NSDate {
    let dateComponents : NSDateComponents = NSDateComponents()
    dateComponents.day = 1
    dateComponents.month = 1
    dateComponents.year = year
    return calendar.dateFromComponents(dateComponents)!
  }
  
  func datesForYear(year: Int) -> [NSDate] {
    let firstDateOfNextYear = firstDayInYear(year + 1)
    var date = firstDayInYear(year)
    let OneDayDateComponents = NSDateComponents()
    OneDayDateComponents.day = 1
    
    var dates : [NSDate] = []
    
    while (!date.isEqualToDate(firstDateOfNextYear)) {
      dates.append(date)
      date = calendar.dateByAddingComponents(OneDayDateComponents, toDate: date, options: .MatchFirst)!
    }
    
    return dates;
  }
  
  func truncateDateToYearMonthDay(date: NSDate) -> NSDate {
    let dateComponents = calendar.components([.Year, .Month, .Day], fromDate: date)
    return calendar.dateFromComponents(dateComponents)!
  }
  
}
