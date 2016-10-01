//
//  HorizontalCalendar.swift
//  HorizontalCalendar
//
//  Created by Raphael Seher on 27/12/15.
//  Copyright © 2015 Raphael Seher. All rights reserved.
//

import UIKit

open class HorizontalCalendar: NSObject {
  let calendar : Calendar!
  
  override init() {
    calendar = Calendar.current
  }

  func currentYear() -> Int {
    let components = calendar.dateComponents([.year], from: Date())
    return components.year!
  }

  func firstDayInYear(_ year: Int) -> Date {
    var dateComponents : DateComponents = DateComponents()
    dateComponents.day = 1
    dateComponents.month = 1
    dateComponents.year = year
    return calendar.date(from: dateComponents)!
  }
  
  func datesForYear(_ year: Int) -> [Date] {
    let firstDateOfNextYear = firstDayInYear(year + 1)
    var date = firstDayInYear(year)
    var OneDayDateComponents = DateComponents()
    OneDayDateComponents.day = 1
    
    var dates : [Date] = []
    
    while (date != firstDateOfNextYear) {
      dates.append(date)
      date = calendar.date(byAdding: OneDayDateComponents, to: date)!
    }
    
    return dates;
  }
  
  func truncateDateToYearMonthDay(_ date: Date) -> Date {
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    return calendar.date(from: dateComponents)!
  }
  
}
